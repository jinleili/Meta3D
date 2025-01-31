type element = {
  elementName: string,
  execOrder: int,
  // elementStateFields: array<ElementAssembleStoreType.elementStateFieldData>,
  // reducers: ElementAssembleStoreType.reducers,
}

type protocolConfigLib = Meta3d.LibUtils.lib

type protocol = {
  name: string,
  version: string,
  configLib: protocolConfigLib,
}

type rec uiControl = {
  displayName: string,
  protocol: protocol,
  data: ElementAssembleStoreType.uiControlInspectorData,
  children: array<uiControl>,
}

type elementMR = {
  element: element,
  uiControls: array<uiControl>,
}

let rec _buildUIControls = (
  service: AssembleSpaceType.service,
  selectedUIControls,
  selectedUIControlInspectorData,
) => {
  selectedUIControls->Meta3dCommonlib.ArraySt.reduceOneParam(
    (.
      uiControls,
      {id, children, protocolConfigStr, data}: ElementAssembleStoreType.uiControl,
    ) => {
      let {name, version} = data.contributePackageData.protocol

      uiControls->Meta3dCommonlib.ArraySt.push({
        displayName: (
          service.meta3d.execGetContributeFunc(. data.contributeFuncData)->Obj.magic
        )["uiControlName"],
        protocol: {
          name,
          version,
          configLib: service.meta3d.serializeUIControlProtocolConfigLib(. protocolConfigStr),
        },
        data: HierachyUtils.findSelectedUIControlData(
          None,
          (
            (data: ElementAssembleStoreType.uiControlInspectorData) => data.id,
            (data: ElementAssembleStoreType.uiControlInspectorData) => data.children,
          ),
          selectedUIControlInspectorData->Meta3dCommonlib.ListSt.fromArray,
          id,
        )->Meta3dCommonlib.OptionSt.getExn,
        children: children
        ->Meta3dCommonlib.ListSt.toArray
        ->_buildUIControls(service, _, selectedUIControlInspectorData),
      })
    },
    [],
  )
}

// let _deepCopySelectedUIControlInspectorData = selectedUIControlInspectorData => {
//   selectedUIControlInspectorData->Obj.magic->Js.Json.stringify->Js.Json.parseExn->Obj.magic
// }

let buildElementMR = (
  service: AssembleSpaceType.service,
  elementName,
  selectedUIControls,
  selectedUIControlInspectorData,
): // elementStateFields,
elementMR => {
  {
    element: {
      elementName,
      execOrder: 0,
      // elementStateFields: elementStateFields->Meta3dCommonlib.ListSt.toArray,
      // reducers,
    },
    uiControls: _buildUIControls(
      service,
      selectedUIControls,
      // selectedUIControlInspectorData->Meta3dCommonlib.Log.printForDebug->_deepCopySelectedUIControlInspectorData->Meta3dCommonlib.Log.printForDebug,
      selectedUIControlInspectorData,
    ),
  }
}

let _getInputName = (data: ElementAssembleStoreType.uiControlInspectorData) => {
  data.input->Meta3dCommonlib.OptionSt.map(input => input.inputName)
}

let _handleVariableName = variableName => {
  variableName->Js.String.replaceByRe(%re("/-/g"), "_", _)
}

let _generateGetUIControlsAndInputsStr = (
  service: AssembleSpaceType.service,
  uiControls,
) => {
  uiControls
  // ->Meta3dCommonlib.ArraySt.removeDuplicateItemsWithBuildKeyFunc((. {displayName}) => {
  //   displayName
  // })
  ->Meta3dCommonlib.ArraySt.reduceOneParam((. str, {displayName, data}) => {
    let inputName = data->_getInputName

    str ++
    (str->Js.String.includes({j`getUIControlFunc(meta3dState,"${displayName}")`}, _)
      ? ""
      : j`
    let ${displayName->_handleVariableName} = getUIControlFunc(meta3dState,"${displayName}")
    `) ++
    switch inputName {
    | None => ""
    | Some(inputName) =>
      str->Js.String.includes({j`getInputFunc(meta3dState,"${inputName}")`}, _)
        ? ""
        : j`
    let ${inputName->_handleVariableName} = getInputFunc(meta3dState,"${inputName}")
    `
    }
  }, "")
  // ->Meta3dCommonlib.Log.printForDebug
}

let getActionName = (event: ElementAssembleStoreType.event, eventName) => {
  event
  ->Meta3dCommonlib.ArraySt.find(eventData => {
    eventData.eventName === eventName
  })
  ->Meta3dCommonlib.OptionSt.map(({actionName}) => actionName)
  ->Meta3dCommonlib.OptionSt.toNullable
}

let _generateHandleUIControlEventStr = (
  service: AssembleSpaceType.service,
  configLib,
  event,
) => {
  service.meta3d.generateHandleUIControlEventStr(.
    configLib,
    service.meta3d.getUIControlSupportedEventNames(.
      configLib,
      // )->Meta3dCommonlib.ArraySt.map(((  eventName, _  )) => {
    )->Meta3dCommonlib.ArraySt.map(eventName => {
      getActionName(event, eventName)
    }),
  )
}

let _generateRectField = (rectField: ElementAssembleStoreType.rectField) => {
  switch rectField {
  | IntForRectField(value) => value->Js.Int.toString
  // | ElementStateFieldForRectField(value) => j`elementState.${value}`
  }
}

let _generateRect = (rect: ElementAssembleStoreType.rect): string => {
  let {x, y, width, height} = rect

  j`{
    x: ${_generateRectField(x)},
    y: ${_generateRectField(y)},
    width: ${_generateRectField(width)},
    height: ${_generateRectField(height)}
    }`
}

// let _generateSpecific = (specific: ElementAssembleStoreType.specific): string => {
//   specific
//   ->Meta3dCommonlib.ArraySt.reduceOneParam(
//     (. map, {name, type_, value}: ElementAssembleStoreType.specificData) => {
//       map->Meta3dCommonlib.ImmutableHashMap.set(
//         name,
//         switch value {
//         | SpecicFieldDataValue(value) => SpecificUtils.convertValueToString(value, type_)
//         | ElementStateFieldForSpecificDataValue(value) => j`elementState.${value}`
//         },
//       )
//     },
//     Meta3dCommonlib.ImmutableHashMap.createEmpty(),
//   )
//   ->Obj.magic
//   ->Js.Json.stringify
// }

let _generateSpecific = (specific: ElementAssembleStoreType.specific): string => {
  specific->Meta3dCommonlib.ArraySt.reduceOneParam(
    (. result, {name, type_, value}: ElementAssembleStoreType.specificData) => {
      result ++
      j`${name}: ` ++
      switch value {
      | SpecicFieldDataValue(value) =>
        switch type_ {
        | #imageBase64 =>
          value->Obj.magic->Meta3dCommonlib.NullableSt.isNullable
            ? {j`null,`}
            : j`"${value->Obj.magic}",`
        | #menuItems => j`${value->Obj.magic->Js.Json.stringify->Obj.magic},`
        | #bool => j`${value->Obj.magic->BoolUtils.boolToString},`
        | #select => j`${SpecificUtils.convertValueToString(value, type_)},`
        | #number => j`${value->NumberUtils.numberToString},`
        | _ => j`"${SpecificUtils.convertValueToString(value->Obj.magic, type_)}",`
        }

      // | ElementStateFieldForSpecificDataValue(value) => j`elementState.${value}`
      }

      // map->Meta3dCommonlib.ImmutableHashMap.set(
      //   name,
      //   switch value {
      //   | SpecicFieldDataValue(value) => SpecificUtils.convertValueToString(value, type_)
      //   | ElementStateFieldForSpecificDataValue(value) => j`elementState.${value}`
      //   },
      // )
    },
    "{",
  ) ++ "}"
}

let _generateIsDrawIfBegin = (isDraw: ElementAssembleStoreType.isDraw) => {
  switch isDraw {
  | BoolForIsDraw(value) => j`if(${value->BoolUtils.boolToString}){`
  // | ElementStateFieldForIsDraw(value) => j`if(elementState.${value}){`
  }
}

let _generateIsDrawIfEnd = () => {
  j`}`
}

let rec _generateChildren = (service, children: array<uiControl>): string => {
  children->Meta3dCommonlib.ArraySt.length === 0
    ? {j`childrenFunc:(meta3dState) => new Promise((resolve, reject) => resolve(meta3dState))`}
    : {
        let str = j`childrenFunc: (meta3dState) =>{
    `
        let str = str ++ _generateGetUIControlsAndInputsStr(service, children)

        let str =
          str ++
          _generateAllDrawUIControlAndHandleEventStr(service, children) ++ {
            j`
        return new Promise((resolve, reject) => resolve(meta3dState))
        `
          }

        str ++ "}"
      }
}
and _generateAllDrawUIControlAndHandleEventStr = (
  service: AssembleSpaceType.service,
  uiControls,
) => {
  let (str, endCount) = uiControls->Meta3dCommonlib.ArraySt.reduceOneParam(
    (. (str, endCount), {displayName, protocol, data, children}) => {
      (
        str ++
        _generateIsDrawIfBegin(data.isDraw) ++
        j`
                 return ${displayName->_handleVariableName}(meta3dState,
        ` ++
        data
        ->_getInputName
        ->Meta3dCommonlib.OptionSt.map(_handleVariableName)
        ->Meta3dCommonlib.OptionSt.getWithDefault({
          j`null`
        }) ++
        "," ++
        {j`
        ${_generateRect(data.rect)},
        `}
        ++
        j`
                {
        ...${_generateSpecific(data.specific)},
      ${_generateChildren(service, children)}
                }
                    ).then(data =>{
                meta3dState = data[0]
` ++
        _generateHandleUIControlEventStr(service, protocol.configLib, data.event),
        endCount->succ,
      )
    },
    (
      `
                let data = null
  `,
      0,
    ),
  )

  let str =
    str ++ `
  return new Promise((resolve) => {
                    resolve(meta3dState)
                })
                `

  Meta3dCommonlib.ArraySt.range(0, endCount - 1)->Meta3dCommonlib.ArraySt.reduceOneParam(
    (. str, _) => {
      str ++ `})` ++ _generateIsDrawIfEnd()
    },
    str,
  )
}

// let _generateElementState = elementStateFields => {
//   elementStateFields
//   ->Meta3dCommonlib.ArraySt.reduceOneParam(
//     (.
//       map,
//       {name, type_, defaultValue}: ElementAssembleStoreType.elementStateFieldData,
//     ) => {
//       switch type_ {
//       | #string => map->Meta3dCommonlib.ImmutableHashMap.set(name, defaultValue)
//       | #int =>
//         map->Meta3dCommonlib.ImmutableHashMap.set(
//           name,
//           defaultValue->Obj.magic->IntUtils.stringToInt->Obj.magic,
//         )
//       | #bool =>
//         map->Meta3dCommonlib.ImmutableHashMap.set(
//           name,
//           defaultValue->Obj.magic->BoolUtils.stringToBool->Obj.magic,
//         )
//       }
//     },
//     Meta3dCommonlib.ImmutableHashMap.createEmpty(),
//   )
//   ->Obj.magic
//   ->Js.Json.stringify
// }

// let _generateReducers = (reducers: ElementAssembleStoreType.reducers) => {
//   switch reducers.role {
//   | None => "null"
//   | Some(role) =>
//     {
//       "role": role,
//       "handlers": reducers.handlers->Meta3dCommonlib.ListSt.toArray,
//     }
//     ->Obj.magic
//     ->Js.Json.stringify
//   }
// }

let generateElementContributeFileStr = (service, mr: elementMR): string => {
  let {elementName, execOrder} = mr.element

  let str = {
    j`
window.Contribute = {
    getContribute: (api) => {
        return {
            elementName:"${elementName}",
            execOrder: ${execOrder->Js.Int.toString},
            elementState: {},
            elementFunc: (meta3dState, elementState) => {
                let ui = api.getPackageService(meta3dState, "meta3d-editor-whole-protocol").ui(meta3dState)

                let { getUIControlFunc, getInputFunc } = ui
`
  }

  let str = str ++ _generateGetUIControlsAndInputsStr(service, mr.uiControls)

  let str = str ++ _generateAllDrawUIControlAndHandleEventStr(service, mr.uiControls)

  let str =
    str ++ `
  return new Promise((resolve) => {
                    resolve(meta3dState)
                })
  `

  let str =
    str ++ `
            }
        }
    }
}
  `

  str
}
