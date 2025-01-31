let getExtensionService: Meta3dType.Index.getExtensionService<
  Meta3dEventProtocol.ServiceType.service,
> = api => {
  eventData: meta3dState => {
    api.getExtensionService(. meta3dState, "meta3d-event-data-protocol")->Obj.magic
  },
  eventSourcing: meta3dState => {
    api.getExtensionService(. meta3dState, "meta3d-event-sourcing-protocol")->Obj.magic
  },
  trigger: EventManager.trigger(api)->Obj.magic,
  registerAction: (meta3dState, actionContribute) => {
    (EventManager.registerAction->Obj.magic)(
      api.getExtensionState(. meta3dState, "meta3d-event-protocol"),
      actionContribute,
    )->api.setExtensionState(. meta3dState, "meta3d-event-protocol", _)
  },
  onPointEvent: EventManager.onPointEvent(api),
  onCustomGlobalEvent: ManageEventAPIForSrc.onCustomGlobalEvent,
  offCustomGlobalEventByHandleFunc: ManageEventAPIForSrc.offCustomGlobalEventByHandleFunc,
  onCustomGlobalEvent2: ManageEventAPIForSrc.onCustomGlobalEvent2(api)->Obj.magic,
  triggerCustomGlobalEvent2: ManageEventAPIForSrc.triggerCustomGlobalEvent2(api)->Obj.magic,
  onCustomGlobalEvent3: ManageEventAPIForSrc.onCustomGlobalEvent3(api)->Obj.magic,
  triggerCustomGlobalEvent3: ManageEventAPIForSrc.triggerCustomGlobalEvent3(api)->Obj.magic,
  createCustomEvent: ManageEventAPIForSrc.createCustomEvent,
  initEvent: EventManager.initEvent(api),
  setBrowser: EventManager.setBrowser(api),
  setCanvas: EventManager.setCanvas(api),
  setBody: EventManager.setBody(api),
  getBrowserChromeType: EventManager.getBrowserChromeType,
  getBrowserFirefoxType: EventManager.getBrowserFirefoxType,
  getBrowserAndroidType: EventManager.getBrowserAndroidType,
  getBrowserIOSType: EventManager.getBrowserIOSType,
  getBrowserUnknownType: EventManager.getBrowserUnknownType,
  getPointDownEventName: EventManager.getPointDownEventName,
  getPointUpEventName: EventManager.getPointUpEventName,
  getPointTapEventName: EventManager.getPointTapEventName,
  getPointMoveEventName: EventManager.getPointMoveEventName,
  getPointScaleEventName: EventManager.getPointScaleEventName,
  getPointDragStartEventName: EventManager.getPointDragStartEventName,
  getPointDragOverEventName: EventManager.getPointDragOverEventName,
  getAllActionContributes: EventManager.getAllActionContributes->Obj.magic,
}

let createExtensionState: Meta3dType.Index.createExtensionState<StateType.state> = (. meta3dState, api) => {
  EventManager.createExtensionState(. meta3dState, api)
}

let getExtensionLife: Meta3dType.Index.getExtensionLife<Meta3dEventProtocol.ServiceType.service> = (
  api,
  extensionProtocolName,
) => {
  {
    onRegister: Js.Nullable.null,
    onRestore: Js.Nullable.null,
    onDeepCopy: (
      meta3dState => {
        let state: StateType.state = api.getExtensionState(. meta3dState, extensionProtocolName)

        api.setExtensionState(.
          meta3dState,
          extensionProtocolName,
          {
            ...state,
            eventManagerState: CreateEventManagerState.deepCopy(state.eventManagerState),
          },
        )
      }
    )->Meta3dCommonlib.NullableSt.return,
    onStart: Js.Nullable.null,
    onInit: Js.Nullable.null,
    onUpdate: Js.Nullable.null,
  }
}
