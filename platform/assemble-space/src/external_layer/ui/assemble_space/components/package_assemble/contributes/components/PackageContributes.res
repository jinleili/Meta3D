open FrontendUtils.Antd
%%raw("import 'antd/dist/antd.css'")
open FrontendUtils.AssembleSpaceType

module Method = {
  let selectContribute = (dispatch, protocolIconBase64, protocolConfigStr, contribute) => {
    dispatch(
      FrontendUtils.PackageAssembleStoreType.SelectContribute(
        protocolIconBase64,
        protocolConfigStr,
        contribute,
      ),
    )
  }
}

@react.component
let make = (~service: service, ~selectedContributesFromMarket: selectedContributesFromMarket) => {
  <ContributesUtils
    service
    selectedContributesFromMarket
    useDispatch=ReduxUtils.PackageAssemble.useDispatch
    selectContribute=Method.selectContribute
  />
}
