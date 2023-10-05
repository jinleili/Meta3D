import { state as meta3dState, getContribute as getContributeMeta3D } from "meta3d-type"
import { actionContribute } from "meta3d-event-protocol/src/contribute/ActionContributeType"
import { clickUIData } from "meta3d-ui-control-button-protocol"
import { actionName, state } from "meta3d-action-import-event-protocol"
import { eventName, inputData } from "meta3d-action-import-event-protocol/src/EventType"
// import { service as runEngineGameViewService } from "meta3d-editor-run-engine-gameview-protocol/src/service/ServiceType"
import { service as eventSourcingService } from "meta3d-event-sourcing-protocol/src/service/ServiceType"
import { events } from "meta3d-event-sourcing-protocol/src/state/StateType"
import { getExn } from "meta3d-commonlib-ts/src/NullableUtils"
import { List } from "immutable"
import { service as eventDataService } from "meta3d-event-data-protocol/src/service/ServiceType"

let _checkOnlyHasImportEvent = (eventSourcingService: eventSourcingService, meta3dState: meta3dState) => {
    let allEvents = eventSourcingService.getAllEvents(meta3dState)

    if (!(allEvents.count() == 1 && getExn(allEvents.last()).name == eventName)) {
        throw new Error("all events should only has import event")
    }
}

let _checkOutsideImmutableDataIsEmpty = (eventSourcingService: eventSourcingService, meta3dState: meta3dState) => {
    if (eventSourcingService.getAllOutsideImmutableData(meta3dState).count() != 0) {
        throw new Error("outside immutable data should be empty")
    }
}

let _parseEventData = (eventDataService: eventDataService, eventData: ArrayBuffer): events => {
    return List(eventDataService.parseEventData(eventData))
}

let _removeAllReadEvents = (events: events) => {
    return events.filter((event => {
        if (!!event.isOnlyRead) {
            return false
        }

        return true
    }))
}

export let getContribute: getContributeMeta3D<actionContribute<clickUIData, state>> = (api) => {
    return {
        actionName: actionName,
        init: (meta3dState) => {
            let eventSourcingService = api.getExtensionService<eventSourcingService>(meta3dState, "meta3d-event-sourcing-protocol")

            return new Promise((resolve, reject) => {
                resolve(eventSourcingService.on<inputData>(meta3dState, eventName, 0, (meta3dState, eventData) => {
                    return new Promise((resolve, reject) => {
                        // TODO contract check
                        _checkOnlyHasImportEvent(eventSourcingService, meta3dState)
                        _checkOutsideImmutableDataIsEmpty(eventSourcingService, meta3dState)

                        debugger

                        let events = _parseEventData(
                            api.getExtensionService<eventDataService>(meta3dState, "meta3d-event-data-protocol"),
                            eventData
                        )


                        events = _removeAllReadEvents(events)

                        meta3dState = eventSourcingService.setNeedReplaceAllEvents(meta3dState, events)

                        // TODO handle outside immutable data

                        resolve(meta3dState)

                    })
                }, (meta3dState) => {
                    return Promise.resolve(meta3dState)
                }))
            })
        },
        handler: (meta3dState, uiData) => {
            console.log("import scene")

            return new Promise<meta3dState>((resolve, reject) => {
                let eventSourcingService = api.getExtensionService<eventSourcingService>(meta3dState, "meta3d-event-sourcing-protocol")

                let input = document.createElement('input')
                input.setAttribute('type', "file")
                input.style.visibility = 'hidden'

                input.onchange = (event) => {
                    let file = (event.target as any).files[0]

                    let reader = new FileReader()

                    reader.onload = () => {
                        if (!file.name.includes(".arraybuffer")) {
                            reject(new Error("文件后缀名应该是.arraybuffer"))
                        }

                        resolve(eventSourcingService.addEvent<inputData>(meta3dState, {
                            name: eventName,
                            inputData: [reader.result as ArrayBuffer]
                        }))
                    }

                    reader.onprogress = (event) => {
                        // TODO show progress message
                        console.log(`loading ${event.loaded / event.total} %`)
                    }

                    reader.onerror = (event) => {
                        reject(new Error(`读取${file.name}错误`))
                    }

                    reader.readAsArrayBuffer(file)
                }

                document.body.appendChild(input)
                input.click()
                document.body.removeChild(input)


            })

        },
        createState: () => null
    }
}
