import { state as meta3dState } from "meta3d-type"
import { service as uiService } from "meta3d-ui-protocol/src/service/ServiceType"
import { converterService, threeAPIService } from "meta3d-three-protocol/src/service/ServiceType"
import { createComposerAndRenderTargetForEngine } from "./RenderJobUtils"
import { setSizeAndViewportForEngine } from "./SetSizeAndViewportUtils"

export let setPixelRatio = (canvas: HTMLCanvasElement) => {
    let pixelRatio = globalThis.devicePixelRatio
    let width = canvas.width
    let height = canvas.height

    canvas.width = Math.floor(width * pixelRatio);
    canvas.height = Math.floor(height * pixelRatio);
    canvas.style.width = width + 'px';
    canvas.style.height = height + 'px';
}

export let init = (meta3dState: meta3dState, [threeAPIService, uiService]: [threeAPIService, uiService], canvas: HTMLCanvasElement) => {
    let renderer = new threeAPIService.WebGLRenderer({
        antialias: true,
        /*! clone canvas to avoid change canvas by three.js
        e.g. change canvas.width when invoke WebGLRenderer->setSize
        */
        canvas: canvas.cloneNode(),
        context: uiService.getContext(meta3dState)
    })


    // renderer.setPixelRatio(window.devicePixelRatio);
    // renderer.setSize(canvas.width, canvas.height);
    // document.body.appendChild(renderer.domElement);
    // renderer.setClearColor(new threeAPIService.Color(0x9C9C9C))
    // renderer.setClearAlpha(1.0)

    return [meta3dState, renderer]
}

// export let initForEngine = (meta3dState: meta3dState, [converterService, threeAPIService, uiService]: [converterService, threeAPIService, uiService], canvas: HTMLCanvasElement) => {
export let initForEngine = (meta3dState: meta3dState, [converterService, threeAPIService]: [converterService, threeAPIService], canvas: HTMLCanvasElement) => {
    meta3dState = converterService.init(meta3dState)


    let renderer = new threeAPIService.WebGLRenderer({
        antialias: true,
        canvas: canvas,
        // context: uiService.getContext(meta3dState)
    })

    let viewSize: [number, number] = [canvas.width, canvas.height]

    let [composer, renderPass] = createComposerAndRenderTargetForEngine(threeAPIService, renderer, viewSize)

    setSizeAndViewportForEngine(renderer, composer, viewSize)

    return [meta3dState, renderer, composer, renderPass]
}
