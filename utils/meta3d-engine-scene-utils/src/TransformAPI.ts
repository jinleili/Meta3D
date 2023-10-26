import { service as engineCoreService } from "meta3d-engine-core-sceneview-protocol/src/service/ServiceType"
import { state as engineCoreState } from "meta3d-engine-core-sceneview-protocol/src/state/StateType"
import { transform, componentName, dataName, localPosition, localRotation, localScale, parent, children, localToWorldMatrix, localEulerAngles } from "meta3d-component-transform-protocol"
import { lookAt as lookAtTransform } from "meta3d-component-commonlib"
import { nullable } from "meta3d-commonlib-ts/src/nullable"
import { gameObject } from "meta3d-gameobject-protocol/src/Index"
import { getExn, getWithDefault, map } from "meta3d-commonlib-ts/src/NullableUtils"
import { buildRemovedName, buildUnUsedName, isValidGameObjectName } from "./Utils"

export function createTransform(engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute,
    createComponent,
    setUsedComponentContribute,
}: engineCoreService): [engineCoreState, transform] {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    let data = createComponent<transform>(contribute)
    contribute = data[0]
    let transform = data[1]

    engineCoreState =
        setUsedComponentContribute(engineCoreState, contribute, componentName)

    return [
        engineCoreState,
        transform
    ]
}

export let getName = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, getComponentData }: engineCoreService, transform: transform): nullable<string> => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    return getComponentData<transform, string>(contribute, transform, dataName.name)
}

export let setName = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, setUsedComponentContribute, setComponentData }: engineCoreService, transform: transform, name: string): engineCoreState => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)


    contribute = setComponentData(contribute, transform, dataName.name, name)

    return setUsedComponentContribute(engineCoreState, contribute, componentName)
}

export let getGameObjects = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, getComponentGameObjects }: engineCoreService, transform: transform): Array<gameObject> => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    return getComponentGameObjects<transform>(contribute, transform)
}

export let getParent = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, getComponentData }: engineCoreService, transform: transform): nullable<parent> => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    return getComponentData<transform, transform>(contribute, transform, dataName.parent)
}

export let setParent = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, setComponentData, setUsedComponentContribute }: engineCoreService, transform: transform, parent: nullable<parent>) => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    contribute = setComponentData(contribute, transform, dataName.parent, parent)

    return setUsedComponentContribute(engineCoreState, contribute, componentName)
}

export let getChildren = (engineCoreState: engineCoreState, engineCoreService: engineCoreService, transform: transform): nullable<children> => {
    let { unsafeGetUsedComponentContribute, getComponentData, getGameObjectName } = engineCoreService

    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    return map((children) => {
        return children.filter(child => {
            let gameObject = getGameObjects(engineCoreState, engineCoreService, child)[0]

            return getWithDefault(map(isValidGameObjectName, getGameObjectName(engineCoreState, gameObject)), true)
        })
    }, getComponentData<transform, children>(contribute, transform, dataName.children))
}

export let getLocalPosition = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, getComponentData }: engineCoreService, transform: transform): localPosition => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    return getExn(getComponentData<transform, localPosition>(contribute, transform, dataName.localPosition))
}

export let setLocalPosition = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, setComponentData, setUsedComponentContribute }: engineCoreService, transform: transform, localPosition: localPosition) => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    contribute = setComponentData(contribute, transform, dataName.localPosition, localPosition)

    return setUsedComponentContribute(engineCoreState, contribute, componentName)
}

export let getLocalRotation = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, getComponentData }: engineCoreService, transform: transform): localRotation => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    return getExn(getComponentData<transform, localRotation>(contribute, transform, dataName.localRotation))
}

export let setLocalRotation = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, setComponentData, setUsedComponentContribute }: engineCoreService, transform: transform, localRotation: localRotation) => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    contribute = setComponentData(contribute, transform, dataName.localRotation, localRotation)

    return setUsedComponentContribute(engineCoreState, contribute, componentName)
}

export let getLocalEulerAngles = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, getComponentData }: engineCoreService, transform: transform): localEulerAngles => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    return getExn(getComponentData<transform, localEulerAngles>(contribute, transform, dataName.localEulerAngles))
}

export let setLocalEulerAngles = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, setComponentData, setUsedComponentContribute }: engineCoreService, transform: transform, localEulerAngles: localEulerAngles) => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    contribute = setComponentData(contribute, transform, dataName.localEulerAngles, localEulerAngles)

    return setUsedComponentContribute(engineCoreState, contribute, componentName)
}


export let getLocalScale = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, getComponentData }: engineCoreService, transform: transform): localScale => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    return getExn(getComponentData<transform, localScale>(contribute, transform, dataName.localScale))
}

export let setLocalScale = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, setComponentData, setUsedComponentContribute }: engineCoreService, transform: transform, localScale: localScale) => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    contribute = setComponentData(contribute, transform, dataName.localScale, localScale)

    return setUsedComponentContribute(engineCoreState, contribute, componentName)
}


export let getLocalToWorldMatrix = (engineCoreState: engineCoreState, { unsafeGetUsedComponentContribute, getComponentData }: engineCoreService, transform: transform): localToWorldMatrix => {
    let contribute = unsafeGetUsedComponentContribute(engineCoreState, componentName)

    return getExn(getComponentData<transform, localToWorldMatrix>(contribute, transform, dataName.localToWorldMatrix))
}

export let lookAt = (engineCoreState: engineCoreState, engineCoreService: engineCoreService, transform: transform, target: [number, number, number]) => {
    let contribute = engineCoreService.unsafeGetUsedComponentContribute(engineCoreState, componentName)

    contribute = lookAtTransform(contribute, engineCoreService, transform, target)

    return engineCoreService.setUsedComponentContribute(engineCoreState, contribute, componentName)
}