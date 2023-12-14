open Antd
%%raw("import 'antd/dist/antd.css'")

type showType =
  | Second
  | Third

@react.component
let make = (~service: FrontendType.service) => {
  // let dispatch = AppStore.useDispatch()
  let {selectedContributes} = AppStore.useSelector((
    {userCenterState}: AppStoreType.state,
  ) => userCenterState)

  let (isLoaded, setIsLoaded) = React.useState(_ => false)
  let (showType, setShowType) = React.useState(_ => Second)
  let (page, setPage) = React.useState(_ => 1)
  let (allPublishContributeProtocols, setAllPublishContributeProtocols) = React.useState(_ => [])
  let (
    allPublishContributeProtocolConfigs,
    setAllPublishContributeProtocolConfigs,
  ) = React.useState(_ => [])
  let (contributeProtocolItem, setContributeProtocolItem) = React.useState(_ => None)
  let (selectPublishContributeProtocol, setSelectPublishContributeProtocol) = React.useState(_ =>
    Meta3dCommonlib.ImmutableHashMap.createEmpty()
  )

  let _onChange = (page, pageSize) => {
    setPage(_ => page)
  }

  RescriptReactRouter.watchUrl(url => {
    switch url.path {
    | list{"ContributeMarket"} =>
      setSelectPublishContributeProtocol(_ => Meta3dCommonlib.ImmutableHashMap.createEmpty())
      // setSelectPublishContribute(_ => Meta3dCommonlib.ImmutableHashMap.createEmpty())

      setContributeProtocolItem(_ => None)
      // setAllPublishContributes(_ => None)

      setShowType(_ => Second)
      setPage(_ => 1)
    | _ => ()
    }
  })->ignore

  React.useEffect1(() => {
    // TODO support > 1000
    service.backend.getAllPublishContributeProtocols(.
      // MarketUtils.getPageSize(),
      // (page - 1) * MarketUtils.getPageSize(),
      MarketUtils.getLimitCount(),
      0,
    )
    ->Meta3dBsMostDefault.Most.flatMap(protocols => {
      service.backend.getAllPublishContributeProtocolConfigs(
        MarketUtils.getLimitCount(),
        0,
      )->Meta3dBsMostDefault.Most.map(
        protocolConfigs => {
          (
            protocols->Meta3dCommonlib.ArraySt.filter(
              ({name}: BackendCloudbaseType.protocol) =>
                name->MarketUtils.isNotInnerProtocol,
            ),
            protocolConfigs->Meta3dCommonlib.ArraySt.filter(
              ({name}: CommonType.protocolConfig) =>
                name->MarketUtils.isNotInnerProtocol,
            ),
          )
        },
        _,
      )
    }, _)
    ->Meta3dBsMostDefault.Most.observe(((protocols, protocolConfigs)) => {
      setAllPublishContributeProtocols(_ => protocols)
      setAllPublishContributeProtocolConfigs(_ => protocolConfigs)
      setIsLoaded(_ => true)
    }, _)
    ->Js.Promise.catch(e => {
      setIsLoaded(_ => false)

      ErrorUtils.errorWithExn(
        e->Error.promiseErrorToExn,
        None,
      )->Obj.magic
    }, _)
    ->ignore

    None
  }, [])

  <Layout>
    <Layout.Header>
      <Nav currentKey="3" />
    </Layout.Header>
    <Layout.Content>
      {!isLoaded
        ? <p> {React.string(`loading...`)} </p>
        : {
            switch contributeProtocolItem {
            | Some(item: BackendCloudbaseType.protocol) =>
              let (protocolName, protocolVersion) = (item.name, item.version)

              <ContributeMarketThird
                service contributeProtocolItem=item allPublishContributeProtocolConfigs
              />
            | None =>
              <List
                itemLayout=#horizontal
                dataSource={MarketUtils.getCurrentPage(
                  allPublishContributeProtocols->MarketUtils.groupAllPublishProtocols,
                  page,
                  MarketUtils.getPageSize(),
                )}
                renderItem={(items: array<BackendCloudbaseType.protocol>) => {
                  let firstItem =
                    items->Meta3dCommonlib.ArraySt.getFirst->Meta3dCommonlib.OptionSt.getExn

                  let item =
                    selectPublishContributeProtocol
                    ->Meta3dCommonlib.ImmutableHashMap.get(firstItem.name)
                    ->Meta3dCommonlib.OptionSt.getWithDefault(firstItem)

                  <List.Item>
                    <List.Item.Meta
                      key={item.displayName}
                      avatar={<img
                        src={item.iconBase64}
                        width="50px"
                        height="50px"
                        onClick={_ => {
                          setContributeProtocolItem(_ => item->Some)
                        }}
                      />}
                      title={<Typography.Title
                        level=3
                        onClick={_ => {
                          // _clearSelectPublishContributeProtocol(item.name)
                          setShowType(_ => Third)

                          setContributeProtocolItem(_ => item->Some)
                        }}>
                        {React.string(item.displayName)}
                      </Typography.Title>}
                      description={UIDescriptionUtils.build(
                        item.account,
                        item.repoLink,
                        item.description,
                      )}
                    />
                    {SelectUtils.buildSelectWithoutEmpty(
                      version =>
                        setSelectPublishContributeProtocol(value =>
                          value->Meta3dCommonlib.ImmutableHashMap.set(
                            item.name,
                            items
                            ->Meta3dCommonlib.ArraySt.find(item => item.version === version)
                            ->Meta3dCommonlib.OptionSt.getExn,
                          )
                        ),
                      item.version,
                      items->Meta3dCommonlib.ArraySt.map(item => item.version),
                    )}
                  </List.Item>
                }}
              />
            }
          }}
    </Layout.Content>
    <Layout.Footer>
      {switch isLoaded {
      | true =>
        switch showType {
        | Second =>
          <Pagination
            current={page}
            defaultPageSize={MarketUtils.getPageSize()}
            total={MarketUtils.getAllProtocolsCount(allPublishContributeProtocols)}
            showSizeChanger=false
            onChange=_onChange
          />
        | Third => React.null
        }

      | false => React.null
      }}
    </Layout.Footer>
  </Layout>
}
