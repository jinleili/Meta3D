import { execFuncType } from "meta3d-core-protocol/src/service/ServiceType"
import { getState, setState } from "../Utils";
import { states } from "meta3d-pipeline-webgl1-three-gameviewrender-protocol/src/StateType";
import { update } from "meta3d-pipeline-webgl1-three-utils/src/UpdateArcballCameraControllerJobUtils";
import { target } from "meta3d-pipeline-webgl1-three-utils/src/Type";
import { getDragOverLocation, getPitch, getTarget, getWheel, getYaw } from "../ArcballCameraControllerEventUtils";
import { service as engineSceneService } from "meta3d-engine-scene-protocol/src/service/ServiceType"
import { service as renderService } from "meta3d-editor-gameview-render-protocol/src/service/ServiceType"
import { getExn } from "meta3d-commonlib-ts/src/NullableUtils";

export let execFunc: execFuncType = (meta3dState, { api, getStatesFunc, setStatesFunc }) => {
    let states = getStatesFunc<states>(meta3dState)
    let {
        mostService,
        lastYaw,
        lastPitch
    } = getState(states)


    return mostService.callFunc(() => {
        if (api.getExtensionService<renderService>(meta3dState, "meta3d-editor-gameview-render-protocol").isPipelineStop(meta3dState)) {
            return meta3dState
        }

        let engineSceneService = getExn(api.getPackageService<engineSceneService>(meta3dState, "meta3d-engine-scene-protocol"))

        let data = update(meta3dState, [
            getDragOverLocation, getPitch, getTarget, getWheel, getYaw
        ], engineSceneService,
            target.SceneView,
            api.getExtensionService<renderService>(meta3dState, "meta3d-editor-gameview-render-protocol").isPipelineStop(meta3dState),
            [
                lastYaw, lastPitch
            ]
        )
        meta3dState = data[0]
        let currentYaw = data[1]
        let currentPitch = data[2]

        return setStatesFunc<states>(
            meta3dState,
            setState(states,
                {
                    ...getState(states),
                    lastYaw: currentYaw,
                    lastPitch: currentPitch,
                }
            )
        )
    })
}