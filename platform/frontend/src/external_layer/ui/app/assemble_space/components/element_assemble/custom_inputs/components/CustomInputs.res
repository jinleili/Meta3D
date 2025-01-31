open Antd
%%raw("import 'antd/dist/reset.css'")
open AssembleSpaceType

module Method = {
  let buildDefaultInputTranspiledFileStr = inputName => {
    j`window.Contribute = {
    getContribute: (api) => {
      return {
        inputName: "${inputName}",
        func: (meta3dState) =>{
            return Promise.resolve(null)
        }
      }
    }
}`
  }

  let buildDefaultInputOriginFileStr = inputName => {
    buildDefaultInputTranspiledFileStr(inputName)->CustomCodeUtils.convertCodeToES6
  }

  let useSelector = ({elementAssembleState}: AssembleSpaceStoreType.state) => {
    let {customInputs, currentCustomInputName} = elementAssembleState

    (customInputs, currentCustomInputName)
  }
}

@react.component
let make = (~service: service, ~addInputButtonTarget: React.ref<Js.Nullable.t<'a>>) => {
  let dispatch = ReduxUtils.ElementAssemble.useDispatch(service.react.useDispatch)

  let (customInputs, currentCustomInputName) = service.react.useSelector(. Method.useSelector)

  <CustomDomUtils
    service
    buildSelectActionFunc={key => ElementAssembleStoreType.SelectCustomInput(key)}
    buildAddActionFunc={customInput => ElementAssembleStoreType.AddCustomInput(customInput)}
    buildRemoveActionFunc={inputName => ElementAssembleStoreType.RemoveCustomInput(inputName)}
    buildDefaultOriginFileStrFunc=Method.buildDefaultInputOriginFileStr
    buildDefaultTranspiledFileStrFunc=Method.buildDefaultInputTranspiledFileStr
    addButtonTarget=addInputButtonTarget
    addEventName={EventUtils.getAddInputEventName()}
    selectEventName={EventUtils.getSelectInputInInputsEventName()}
    setCurrentCustomNameToGlobalFunc=CodeEditUtils.setCurrentCustomInputNameToGlobal
    currentCustomName=currentCustomInputName
    customs=customInputs
    prefix="Input"
  />
}
