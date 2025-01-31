open Antd
%%raw("import 'antd/dist/reset.css'")
open AssembleSpaceType

module Method = {
  // let setRect = (dispatch, id, rect) => {
  //   dispatch(ElementAssembleStoreType.SetRect(id, rect))
  // }
  let setRectX = (dispatch, id, rect, x) => {
    dispatch(
      ElementAssembleStoreType.SetRect(
        id,
        {
          ...rect,
          x,
        },
      ),
    )
  }

  let setRectY = (dispatch, id, rect, y) => {
    dispatch(
      ElementAssembleStoreType.SetRect(
        id,
        {
          ...rect,
          y,
        },
      ),
    )
  }

  let setRectWidth = (dispatch, id, rect, width) => {
    dispatch(
      ElementAssembleStoreType.SetRect(
        id,
        {
          ...rect,
          width,
        },
      ),
    )
  }

  let setRectHeight = (dispatch, id, rect, height) => {
    dispatch(
      ElementAssembleStoreType.SetRect(
        id,
        {
          ...rect,
          height,
        },
      ),
    )
  }

  let setIsDraw = (dispatch, id, isDraw) => {
    dispatch(ElementAssembleStoreType.SetIsDraw(id, isDraw))
  }

  let buildInputNameSelectValues = (service, selectedContributes, uiControlProtocolName) => {
    MessageUtils.showCatchedErrorMessageAndReturn(
      (. ()) => {
        // input: option<ElementAssembleStoreType.input>,

        // let values =
        SelectedContributesForElementUtils.getInputs(selectedContributes)
        ->Meta3dCommonlib.ListSt.toArray

        // TODO open this filter
        // ->Meta3dCommonlib.ArraySt.filter(({data}) => {
        //   // data.contributePackageData.protocol.name->Js.String.replace("-input-", "-ui-control-", _) ==
        //   //   uiControlProtocolName

        //   (
        //     data.contributePackageData.protocol.name
        //     ->Js.String.match_(%re("/-input-(.+)$/i"), _)
        //     ->Meta3dCommonlib.OptionSt.getExn
        //   )[1]->Meta3dCommonlib.OptionSt.getExn ==
        //     (
        //       uiControlProtocolName
        //       ->Js.String.match_(%re("/-ui-control-(.+)$/i"), _)
        //       ->Meta3dCommonlib.OptionSt.getExn
        //     )[1]->Meta3dCommonlib.OptionSt.getExn
        // })
        ->Meta3dCommonlib.ArraySt.map(({data}) => {
          (service.meta3d.execGetContributeFunc(. data.contributeFuncData)->Obj.magic)["inputName"]
        })
      },
      (. ()) => {
        []
      },
      5->Some,
    )->Obj.magic

    // switch input {
    // | Some({inputName}) if !(values->Meta3dCommonlib.ArraySt.includes(inputName)) =>
    //   values->Meta3dCommonlib.ArraySt.push(inputName)
    // // ->Meta3dCommonlib.ArraySt.removeDuplicateItemsWithBuildKeyFunc((. value) => value)
    // | _ => values
    // }
  }

  let setInput = (dispatch, id, inputName: string) => {
    // setInputFileStr(_ => None)

    dispatch(
      ElementAssembleStoreType.SetInput(
        id,
        SelectUtils.isEmptySelectOptionValue(inputName) ? None : Some(inputName),
      ),
    )
  }

  //   let buildDefaultInputFileStr = (random, uiControlProtocolName) => {
  //     j`window.Contribute = {
  //     getContribute: (api) => {
  //       return {
  //         inputName: "${ElementVisualUtils.buildDefaultInputNameForCustomInput(
  //         random,
  //         uiControlProtocolName,
  //       )}",
  //         func: (meta3dState) =>{
  //             return Promise.resolve(null)
  //         }
  //       }
  //     }
  // }`
  //   }

  //   let getInputName = inputFileStr => {
  //     (
  //       inputFileStr
  //       ->Meta3dCommonlib.OptionSt.getExn
  //       ->Js.String.match_(%re("/inputName\:\s\"(.+)\",/im"), _)
  //       ->Meta3dCommonlib.OptionSt.getExn
  //     )[1]->Meta3dCommonlib.OptionSt.getExn
  //   }

  //   let setInputFileStrData = (dispatch, id, inputName, inputFileStr) => {
  //     switch inputFileStr {
  //     | Some(inputFileStr) =>
  //       dispatch(ElementAssembleStoreType.SetInputFileStr(id, inputName, inputFileStr))
  //     | None => ()
  //     }
  //   }

  let getActions = SelectedContributesForElementUtils.getActions

  let setAction = (
    dispatch,
    id,
    eventName: Meta3dType.UIControlProtocolConfigType.supportedEventName,
    actionName: string,
  ) => {
    dispatch(
      ElementAssembleStoreType.SetAction(
        id,
        (eventName, SelectUtils.isEmptySelectOptionValue(actionName) ? None : Some(actionName)),
      ),
    )
  }

  let buildActionNameSelectValues = (service, actions) => {
    MessageUtils.showCatchedErrorMessageAndReturn(
      (. ()) => {
        actions->Meta3dCommonlib.ArraySt.map(({data}: ApAssembleStoreType.contribute) => {
          (service.meta3d.execGetContributeFunc(. data.contributeFuncData)->Obj.magic)["actionName"]
        })
      },
      (. ()) => {
        []
      },
      5->Some,
    )->Obj.magic
  }

  //   let buildDefaultActionFileStr = (random, uiControlProtocolName, eventName) => {
  //     j`window.Contribute = {
  //   getContribute: (api) => {
  //     return {
  //       actionName: "${ElementVisualUtils.buildDefaultActionNameForCustomAction(
  //         random,
  //         uiControlProtocolName,
  //         eventName,
  //       )}",
  //       init: (meta3dState) => {
  //         let eventSourcingService = api.getPackageService(meta3dState, "meta3d-editor-whole-protocol").event(meta3dState).eventSourcing(meta3dState)

  //         return new Promise((resolve, reject) => {
  //           resolve(eventSourcingService.on(meta3dState, "${eventName}", 0, (meta3dState) => {
  //             return Promise.resolve(meta3dState)
  //           }, (meta3dState) => {
  //             return Promise.resolve(meta3dState)
  //           }))
  //         })
  //       },
  //       handler: (meta3dState, uiData) => {
  //         return new Promise((resolve, reject) => {
  //           let eventSourcingService = api.getPackageService(meta3dState, "meta3d-editor-whole-protocol").event(meta3dState).eventSourcing(meta3dState)

  //           resolve(eventSourcingService.addEvent(meta3dState, {
  //             name: "${eventName}",
  //             inputData: []
  //           }))
  //         })
  //       },
  //       createState: () => {
  //         return null
  //       }
  //     }
  //   }
  // }`
  //   }

  //   let getActionName = actionFileStr => {
  //     (
  //       actionFileStr
  //       ->Meta3dCommonlib.OptionSt.getExn
  //       ->Js.String.match_(%re("/actionName\:\s\"(.+)\",/im"), _)
  //       ->Meta3dCommonlib.OptionSt.getExn
  //     )[1]->Meta3dCommonlib.OptionSt.getExn
  //   }

  //   let setActionFileStrData = (dispatch, id, eventName, actionName, actionFileStr) => {
  //     switch actionFileStr {
  //     | Some(actionFileStr) =>
  //       dispatch(
  //         ElementAssembleStoreType.SetActionFileStr(
  //           id,
  //           eventName,
  //           actionName,
  //           actionFileStr,
  //         ),
  //       )
  //     | None => ()
  //     }
  //   }

  let _getRectFieldIntValue = (rectField: ElementAssembleStoreType.rectField) => {
    switch rectField {
    | IntForRectField(value) => value->Some
    | _ => None
    }
  }

  // let _getRectFieldElementFieldValue = (
  //   rectField: ElementAssembleStoreType.rectField,
  // ) => {
  //   switch rectField {
  //   | ElementStateFieldForRectField(value) => value->Some
  //   | _ => None
  //   }
  // }

  // let _getSpecificTypeElementStateFieldNames = (
  //   elementStateFields: ElementAssembleStoreType.elementStateFields,
  //   specificType,
  // ) => {
  //   elementStateFields
  //   ->Meta3dCommonlib.ListSt.filter(({type_}) => type_ == specificType)
  //   ->Meta3dCommonlib.ListSt.map(({name}) => name)
  // }

  // let buildRectField = (dispatch, setRectField, elementStateFields, id, rect, rectField) => {
  let buildRectField = (dispatch, setRectField, id, label, rect, rectField, ref) => {
    <Space direction=#horizontal>
      <span> {React.string({j`${label}: `})} </span>
      <InputNumber
        ref
        value={rectField
        ->_getRectFieldIntValue
        ->Meta3dCommonlib.OptionSt.getWithDefault(0)
        ->Obj.magic}
        step="1"
        onChange={value => {
          setRectField(dispatch, id, rect, value->Obj.magic->CommonType.IntForRectField)
        }}
      />
      // {SelectUtils.buildSelect(value =>
      //   SelectUtils.isEmptySelectOptionValue(value)
      //     ? ()
      //     : {
      //         setRectField(
      //           dispatch,
      //           id,
      //           rect,
      //           value->ElementAssembleStoreType.ElementStateFieldForRectField,
      //         )
      //       }
      // , rectField
      // ->_getRectFieldElementFieldValue
      // ->Meta3dCommonlib.OptionSt.getWithDefault(
      //   SelectUtils.buildEmptySelectOptionValue(),
      // ), elementStateFields
      // ->_getSpecificTypeElementStateFieldNames(#int)
      // ->Meta3dCommonlib.ListSt.toArray)}
    </Space>
  }

  let getIsDrawBoolValue = (isDraw: ElementAssembleStoreType.isDraw) => {
    switch isDraw {
    | BoolForIsDraw(value) => value->Some
    | _ => None
    }
  }

  // let getIsDrawElementFieldValue = (isDraw: ElementAssembleStoreType.isDraw) => {
  //   switch isDraw {
  //   | ElementStateFieldForIsDraw(value) => value->Some
  //   | _ => None
  //   }
  // }

  // let getBoolElementStateFieldNames = (
  //   elementStateFields: ElementAssembleStoreType.elementStateFields,
  // ) => {
  //   elementStateFields
  //   ->Meta3dCommonlib.ListSt.filter(({type_}) => type_ == #bool)
  //   ->Meta3dCommonlib.ListSt.map(({name}) => name)
  // }

  // let buildIsDraw = (dispatch, id, isDraw) => {
  //   <Space direction=#vertical>
  //     {SelectUtils.buildSelectWithoutEmpty(
  //       value =>
  //         setIsDraw(
  //           dispatch,
  //           id,
  //           value->BoolUtils.stringToBool->CommonType.BoolForIsDraw,
  //         ),
  //       isDraw
  //       ->getIsDrawBoolValue
  //       ->Meta3dCommonlib.OptionSt.getWithDefault(true)
  //       ->BoolUtils.boolToString,
  //       ["true", "false"],
  //     )}
  //     // {SelectUtils.buildSelect(value =>
  //     //   SelectUtils.isEmptySelectOptionValue(value)
  //     //     ? ()
  //     //     : {
  //     //         setIsDraw(
  //     //           dispatch,
  //     //           id,
  //     //           value->ElementAssembleStoreType.ElementStateFieldForIsDraw,
  //     //         )
  //     //       }
  //     // , isDraw
  //     // ->getIsDrawElementFieldValue
  //     // ->Meta3dCommonlib.OptionSt.getWithDefault(
  //     //   SelectUtils.buildEmptySelectOptionValue(),
  //     // ), elementStateFields->getBoolElementStateFieldNames->Meta3dCommonlib.ListSt.toArray)}
  //   </Space>
  // }

  let _setSpecificData = (dispatch, specific, id, i, value, type_) => {
    dispatch(
      ElementAssembleStoreType.SetSpecificData(
        id,
        specific->Meta3dCommonlib.ArraySt.mapi((
          specificData: ElementAssembleStoreType.specificData,
          j,
        ) => {
          j === i
            ? {
                ...specificData,
                value,
              }
            : specificData
        }),
      ),
    )
  }

  let _buildSpecificStringValueKey = (id, name) => {
    j`${id}_${name}`
  }

  // let _getSpecificDataValueElementFieldValue = (
  //   specificDataValue: ElementAssembleStoreType.specificDataValue,
  // ) => {
  //   switch specificDataValue {
  //   | ElementStateFieldForSpecificDataValue(value) => value->Some
  //   | _ => None
  //   }
  // }

  let buildSpecific = (
    service,
    dispatch,
    setSpecificStringValueFunc,
    specificStringValue,
    id,
    specific,
  ) => {
    <>
      {specific
      ->Meta3dCommonlib.ArraySt.mapi((
        {type_, value, name}: ElementAssembleStoreType.specificData,
        i,
      ) => {
        <Card key={name} title={name}>
          {switch type_ {
          | #string =>
            <Input
              key={name}
              value={specificStringValue
              ->Meta3dCommonlib.ImmutableHashMap.get(_buildSpecificStringValueKey(id, name))
              ->Meta3dCommonlib.OptionSt.getWithDefault(
                SpecificUtils.getSpecificDataValue(value)->SpecificUtils.convertValueToString(
                  type_,
                ),
              )}
              onChange={e => {
                switch e
                ->EventUtils.getEventTargetValue
                ->SpecificUtils.convertStringToValue(type_) {
                | value if value->Obj.magic == "" => MessageUtils.warn({j`不能为空`}, None)
                | value =>
                  // _setSpecificData(
                  //   dispatch,
                  //   specific,
                  //   id,
                  //   i,
                  //   value->CommonType.SpecicFieldDataValue,
                  //   type_,
                  // )

                  setSpecificStringValueFunc(specificStringValue =>
                    specificStringValue->Meta3dCommonlib.ImmutableHashMap.set(
                      _buildSpecificStringValueKey(id, name),
                      value->Obj.magic,
                    )
                  )
                }
              }}
              onBlur={e => {
                // switch e
                // ->EventUtils.getEventTargetValue
                // ->SpecificUtils.convertStringToValue(type_) {
                // | value if value->Obj.magic == "" => MessageUtils.warn({j`不能为空`}, None)
                // | value =>
                //   _setSpecificData(
                //     dispatch,
                //     specific,
                //     id,
                //     i,
                //     value->CommonType.SpecicFieldDataValue,
                //     type_,
                //   )
                // }

                _setSpecificData(
                  dispatch,
                  specific,
                  id,
                  i,
                  specificStringValue
                  ->Meta3dCommonlib.ImmutableHashMap.get(_buildSpecificStringValueKey(id, name))
                  ->Meta3dCommonlib.OptionSt.getWithDefault(
                    SpecificUtils.getSpecificDataValue(value)->SpecificUtils.convertValueToString(
                      type_,
                    ),
                  )
                  ->Obj.magic
                  ->CommonType.SpecicFieldDataValue,
                  type_,
                )
              }}
            />
          | #imageBase64 =>
            <Space direction=#horizontal>
              <Upload
                listType=#pictureCard
                beforeUpload={file =>
                  UploadUtils.handleUploadImage(
                    (file, imageBase64) => {
                      _setSpecificData(
                        dispatch,
                        specific,
                        id,
                        i,
                        imageBase64->CommonType.SpecicFieldDataValue,
                        type_,
                      )
                    },
                    (_, _) => (),
                    (event, _) => {
                      service.console.error(. {j`error`}, None)
                    },
                    file,
                  )}
                showUploadList=false>
                <Button icon={<Icon.UploadOutlined />}> {React.string(`上传图片`)} </Button>
              </Upload>
              // {switch imageBase64Map->Meta3dCommonlib.ImmutableHashMap.get(
              //   buildImageBase64MapKey(id, i),
              // ) {
              // | Some(imageBase64) => <Image preview=true src={imageBase64} width=40 height=40 />
              // | None =>
              //   // React.null
              //   <Image
              //     preview=true
              //     src={

              //       SpecificUtils.getSpecificDataValue(value)->SpecificUtils.convertValueToString(type_)}
              //     width=40
              //     height=40
              //   />
              // }}

              {SpecificUtils.getSpecificDataValue(value)
              ->Obj.magic
              ->Meta3dCommonlib.NullableSt.isNullable
                ? React.null
                : <Image
                    preview=true
                    src={SpecificUtils.getSpecificDataValue(
                      value,
                    )->SpecificUtils.convertValueToString(type_)}
                    width=40
                    height=40
                  />}
            </Space>
          | #menuItems =>
            TextareaUtils.isNotShowTextareaForTest()
              ? React.null
              : <Space direction=#horizontal>
                  <Input.TextArea
                    value={SpecificUtils.getSpecificDataValue(
                      value,
                    )->SpecificUtils.convertValueToString(type_)}
                    onChange={e => {
                      MessageUtils.swallowCatchedError(() => {
                        _setSpecificData(
                          dispatch,
                          specific,
                          id,
                          i,
                          e
                          ->EventUtils.getEventTargetValue
                          ->SpecificUtils.convertStringToValue(type_)
                          ->CommonType.SpecicFieldDataValue,
                          type_,
                        )
                      }, {j`不是有效的json`})
                    }}
                  />
                </Space>
          | #bool =>
            SelectUtils.buildSelectWithoutEmpty(
              value =>
                _setSpecificData(
                  dispatch,
                  specific,
                  id,
                  i,
                  value->SpecificUtils.convertStringToValue(type_)->CommonType.SpecicFieldDataValue,
                  type_,
                ),
              SpecificUtils.getSpecificDataValue(value)->SpecificUtils.convertValueToString(type_),
              ["true", "false"],
            )
          | #select => SelectUtils.buildSelectWithKeysAndWithoutEmpty(selectedValue => {
              _setSpecificData(
                dispatch,
                specific,
                id,
                i,
                {
                  "selected": selectedValue,
                  "data": (SpecificUtils.getSpecificDataValue(value)->Obj.magic)["data"],
                }
                ->Obj.magic
                ->CommonType.SpecicFieldDataValue,
                type_,
              )
            }, (
              SpecificUtils.getSpecificDataValue(value)->Obj.magic
            )["selected"], (
              SpecificUtils.getSpecificDataValue(value)->Obj.magic
            )["data"]->Meta3dCommonlib.ArraySt.map(
              valueData => valueData["key"],
            ), (
              SpecificUtils.getSpecificDataValue(value)->Obj.magic
            )["data"]->Meta3dCommonlib.ArraySt.map(valueData => valueData["value"]))
          | #number =>
            <InputNumber
              key={name}
              value={SpecificUtils.getSpecificDataValue(value)->Obj.magic}
              step="0.0001"
              onChange={value => {
                _setSpecificData(
                  dispatch,
                  specific,
                  id,
                  i,
                  value->Obj.magic->CommonType.SpecicFieldDataValue,
                  type_,
                )
              }}
            />
          }}
        </Card>
      })
      ->React.array}
    </>
  }

  let useSelector = ({eventEmitter}: AppStoreType.state) => {
    eventEmitter
  }
}

@react.component
let make = (
  ~service: service,
  ~currentSelectedUIControl: ElementAssembleStoreType.uiControl,
  ~currentSelectedUIControlInspectorData: ElementAssembleStoreType.uiControlInspectorData,
  ~selectedContributes,
  ~rectXInputTarget: React.ref<Js.Nullable.t<'a>>,
  ~rectYInputTarget: React.ref<Js.Nullable.t<'a>>,
  ~rectWidthInputTarget: React.ref<Js.Nullable.t<'a>>,
  ~rectHeightInputTarget: React.ref<Js.Nullable.t<'a>>,
  ~inputSelectTarget: React.ref<Js.Nullable.t<'a>>,
  ~actionSelectTarget: React.ref<Js.Nullable.t<'a>>,
) => {
  let dispatch = ReduxUtils.ElementAssemble.useDispatch(service.react.useDispatch)

  let eventEmitter = service.react.useAllSelector(. Method.useSelector)

  // let (inputFileStr, setInputFileStr) = service.react.useState(_ =>
  //   currentSelectedUIControlInspectorData.input->Meta3dCommonlib.OptionSt.bind(({inputFileStr}) =>
  //     inputFileStr
  //   )
  // )
  // let (actionFileStrMap, setActionFileStrMap) = service.react.useState(_ => {
  //   currentSelectedUIControlInspectorData.event->Meta3dCommonlib.ArraySt.reduceOneParam(
  //     (. map, {eventName, actionFileStr}) => {
  //       switch actionFileStr {
  //       | Some(actionFileStr) =>
  //         map->Meta3dCommonlib.ImmutableHashMap.set(eventName->Obj.magic, actionFileStr)
  //       | None => map
  //       }
  //     },
  //     Meta3dCommonlib.ImmutableHashMap.createEmpty(),
  //   )
  // })
  let (inputNameSelectValues, setInputNameSelectValues) = service.react.useState(_ => [])
  let (actionNameSelectValues, setActionNameSelectValues) = service.react.useState(_ => [])
  let (specificStringValue, setSpecificStringValue) = service.react.useState(_ =>
    Meta3dCommonlib.ImmutableHashMap.createEmpty()
  )

  let {id, rect, isDraw, input, event, specific} = currentSelectedUIControlInspectorData
  let {x, y, width, height} = rect

  let {protocolConfigStr, data} = currentSelectedUIControl

  let actions = selectedContributes->Method.getActions->Meta3dCommonlib.ListSt.toArray

  let uiControlConfigLib = service.meta3d.serializeUIControlProtocolConfigLib(. protocolConfigStr)

  let uiControlProtocolName = data.contributePackageData.protocol.name

  service.react.useEffect1(. () => {
    setInputNameSelectValues(_ =>
      Method.buildInputNameSelectValues(service, selectedContributes, uiControlProtocolName)
    )
    setActionNameSelectValues(_ => Method.buildActionNameSelectValues(service, actions))

    None
  }, [selectedContributes])

  <Space direction=#vertical size=#middle>
    {service.ui.buildTitle(. ~level=2, ~children={React.string(`Rect`)}, ())}
    <Space direction=#vertical>
      {Method.buildRectField(dispatch, Method.setRectX, id, "X", rect, x, rectXInputTarget)}
      {Method.buildRectField(
        dispatch,
        Method.setRectY,
        id,
        "Y",
        rect,
        y,
        rectYInputTarget->Obj.magic,
      )}
      {Method.buildRectField(
        dispatch,
        Method.setRectWidth,
        id,
        "宽",
        rect,
        width,
        rectWidthInputTarget,
      )}
      {Method.buildRectField(
        dispatch,
        Method.setRectHeight,
        id,
        "高",
        rect,
        height,
        rectHeightInputTarget,
      )}
    </Space>
    // {service.ui.buildTitle(. ~level=2, ~children={React.string(`IsDraw`)}, ())}
    // {Method.buildIsDraw(dispatch, id, isDraw)}
    <Space direction=#vertical size=#middle>
      {service.ui.buildTitle(. ~level=2, ~children={React.string(`Input`)}, ())}
      {<>
        <section ref={inputSelectTarget->Obj.magic}>
          {SelectUtils.buildSelect(
            value => {
              Method.setInput(dispatch, id, value)
              eventEmitter.emit(.
                EventUtils.getSelectInputInUIControlInspectorEventName(),
                value->Obj.magic,
              )
            },
            input
            ->Meta3dCommonlib.OptionSt.map(input => input.inputName)
            ->Meta3dCommonlib.OptionSt.getWithDefault(SelectUtils.buildEmptySelectOptionValue()),
            // Method.buildInputNameSelectValues(
            //   service,
            //   selectedContributes,
            //   uiControlProtocolName,
            //   // input,
            // ),
            inputNameSelectValues,
          )}
        </section>
        // {TextareaUtils.isNotShowTextareaForTest()
        //   ? React.null
        //   : <Input.TextArea
        //       value={inputFileStr->Meta3dCommonlib.OptionSt.getWithDefault(
        //         Method.buildDefaultInputFileStr(Js.Math.random, uiControlProtocolName),
        //       )}
        //       onChange={e => {
        //         setInputFileStr(_ => e->EventUtils.getEventTargetValue->Some)
        //       }}
        //     />}
        // <Button
        //   onClick={_ => {
        //     MessageUtils.showCatchedErrorMessage(() => {
        //       Method.setInputFileStrData(
        //         dispatch,
        //         id,
        //         Method.getInputName(inputFileStr),
        //         inputFileStr,
        //       )
        //     }, 5->Some)
        //   }}>
        //   {React.string(`提交`)}
        // </Button>
      </>}
      {service.ui.buildTitle(. ~level=2, ~children={React.string(`Specific`)}, ())}
      {Method.buildSpecific(
        service,
        dispatch,
        setSpecificStringValue,
        specificStringValue,
        id,
        specific,
      )}
      {service.ui.buildTitle(. ~level=2, ~children={React.string(`Event`)}, ())}
      <List
        dataSource={service.meta3d.getUIControlSupportedEventNames(. uiControlConfigLib)}
        renderItem={eventName => {
          let value =
            ElementMRUtils.getActionName(
              event,
              eventName,
            )->Meta3dCommonlib.NullableSt.getWithDefault(SelectUtils.buildEmptySelectOptionValue())

          <List.Item key={eventName->Obj.magic}>
            <Space direction=#vertical size=#middle>
              {<Space direction=#horizontal size=#middle>
                <span> {React.string({j`${eventName->Obj.magic}: `})} </span>
                <section ref={actionSelectTarget->Obj.magic}>
                  {SelectUtils.buildSelect(
                    value => {
                      Method.setAction(dispatch, id, eventName, value)
                      eventEmitter.emit(.
                        EventUtils.getSelectActionInUIControlInspectorEventName(),
                        value->Obj.magic,
                      )
                    },
                    value,
                    // Method.buildActionNameSelectValues(
                    //   service,
                    //   actions,
                    //   // ElementMRUtils.getActionName(
                    //   //   event,
                    //   //   eventName,
                    //   // )->Meta3dCommonlib.OptionSt.fromNullable,
                    // ),
                    actionNameSelectValues,
                  )}
                </section>
              </Space>}
              // {TextareaUtils.isNotShowTextareaForTest()
              //   ? React.null
              //   : <Input.TextArea
              //       value={actionFileStrMap
              //       ->Meta3dCommonlib.ImmutableHashMap.get(eventName->Obj.magic)
              //       ->Meta3dCommonlib.OptionSt.getWithDefault(
              //         Method.buildDefaultActionFileStr(
              //           Js.Math.random,
              //           uiControlProtocolName,
              //           eventName->Obj.magic,
              //         ),
              //       )}
              //       onChange={e => {
              //         setActionFileStrMap(map =>
              //           map->Meta3dCommonlib.ImmutableHashMap.set(
              //             eventName->Obj.magic,
              //             e->EventUtils.getEventTargetValue,
              //           )
              //         )
              //       }}
              //     />}
              // <Button
              //   onClick={_ => {
              //     MessageUtils.showCatchedErrorMessage(() => {
              //       Method.setActionFileStrData(
              //         dispatch,
              //         id,
              //         eventName,
              //         Method.getActionName(
              //           actionFileStrMap->Meta3dCommonlib.ImmutableHashMap.get(
              //             eventName->Obj.magic,
              //           ),
              //         ),
              //         actionFileStrMap->Meta3dCommonlib.ImmutableHashMap.get(eventName->Obj.magic),
              //       )
              //     }, 5->Some)
              //   }}>
              //   {React.string(`提交`)}
              // </Button>
            </Space>
          </List.Item>
        }}
      />
    </Space>
  </Space>
}
