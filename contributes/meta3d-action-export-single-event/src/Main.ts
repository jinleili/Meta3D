import { state as meta3dState, getContribute as getContributeMeta3D } from "meta3d-type"
import { actionContribute, service as editorWholeService } from "meta3d-editor-whole-protocol/src/service/ServiceType"
import { uiData, actionName, state } from "meta3d-action-export-single-event-protocol"
import { eventName, inputData } from "meta3d-action-export-single-event-protocol/src/EventType"
import { eventName as ImportSingleEventEventName } from "meta3d-action-import-single-event-protocol/src/EventType"

export let getContribute: getContributeMeta3D<actionContribute<uiData, state>> = (api) => {
    return {
        actionName: actionName,
        init: (meta3dState) => {
            let eventSourcingService = api.nullable.getExn(api.getPackageService<editorWholeService>(meta3dState, "meta3d-editor-whole-protocol")).event(meta3dState).eventSourcing(meta3dState)

            return new Promise((resolve, reject) => {
                resolve(eventSourcingService.on<inputData>(meta3dState, eventName, 0, (meta3dState) => {
                    let editorWholeService = api.nullable.getExn(api.getPackageService<editorWholeService>(meta3dState, "meta3d-editor-whole-protocol"))

                    return (new Promise((resolve, reject) => {
                        return editorWholeService.exportScene([(glb) => {
                            resolve(glb)
                        }, (err) => {
                            throw err
                        }], meta3dState)
                    }) as Promise<ArrayBuffer>).then(sceneGLB => {
                        // let assetService = api.getExtensionService<assetService>(meta3dState, "meta3d-asset-protocol")

                        // let assetFile = assetService.exportAsset(meta3dState)

                        let allEvents = eventSourcingService.createAllEvents(
                            [{
                                name: ImportSingleEventEventName,
                                isOnlyRead: false,
                                inputData: [
                                    sceneGLB,
                                    // assetFile
                                ]
                            }],
                            meta3dState
                        ).toArray()

                        editorWholeService.event(meta3dState).eventData(meta3dState).exportEventData(allEvents as any)

                        return Promise.resolve(meta3dState)
                    })
                }, (meta3dState) => {
                    return Promise.resolve(meta3dState)
                }))
            })
        },
        handler: (meta3dState, uiData) => {
            return new Promise<meta3dState>((resolve, reject) => {
                let eventSourcingService = api.nullable.getExn(api.getPackageService<editorWholeService>(meta3dState, "meta3d-editor-whole-protocol")).event(meta3dState).eventSourcing(meta3dState)

                resolve(eventSourcingService.addEvent<inputData>(meta3dState, {
                    name: eventName,
                    isOnlyRead: true,
                    inputData: []
                }))
            })

        },
        createState: () => null
    }
}
