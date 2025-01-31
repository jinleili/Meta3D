'use strict';

var Sinon = require("meta3d-bs-sinon/lib/js/src/sinon.bs.js");
var Caml_option = require("rescript/lib/js/caml_option.js");
var Main$Meta3dUi = require("../../src/Main.bs.js");
var UIManager$Meta3dUi = require("../../src/UIManager.bs.js");
var ImguiRendererServiceTool$Meta3dUi = require("./ImguiRendererServiceTool.bs.js");

function createState(param) {
  return Main$Meta3dUi.createExtensionState(1, 1);
}

function init(sandbox, getExtensionService, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, imguiRendererExtensionProtocolNameOpt, isInitEventOpt, isDebugOpt, meta3dStateOpt, canvasOpt, param) {
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  var imguiRendererExtensionProtocolName = imguiRendererExtensionProtocolNameOpt !== undefined ? imguiRendererExtensionProtocolNameOpt : "imguiRendererExtensionProtocolName";
  var isInitEvent = isInitEventOpt !== undefined ? isInitEventOpt : true;
  var isDebug = isDebugOpt !== undefined ? isDebugOpt : false;
  var meta3dState = meta3dStateOpt !== undefined ? meta3dStateOpt : 1;
  var canvas = canvasOpt !== undefined ? Caml_option.valFromOption(canvasOpt) : 10;
  return UIManager$Meta3dUi.init(meta3dState, [
              {
                registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getExtensionService: getExtensionService,
                getExtensionState: getExtensionState,
                setExtensionState: setExtensionState,
                getPackageService: getPackageService,
                registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getAllContributesByType: getAllContributesByType,
                getPackage: getPackage,
                restore: restore,
                deepCopy: deepCopy,
                nullable: 1,
                immutable: 1,
                action: 1,
                uiControl: 1
              },
              imguiRendererExtensionProtocolName
            ], isInitEvent, isDebug, canvas);
}

function clear(sandbox, clearColor, getExtensionService, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, imguiRendererExtensionProtocolNameOpt, meta3dStateOpt, param) {
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  var imguiRendererExtensionProtocolName = imguiRendererExtensionProtocolNameOpt !== undefined ? imguiRendererExtensionProtocolNameOpt : "imguiRendererExtensionProtocolName";
  var meta3dState = meta3dStateOpt !== undefined ? meta3dStateOpt : 1;
  return UIManager$Meta3dUi.clear(meta3dState, [
              {
                registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getExtensionService: getExtensionService,
                getExtensionState: getExtensionState,
                setExtensionState: setExtensionState,
                getPackageService: getPackageService,
                registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getAllContributesByType: getAllContributesByType,
                getPackage: getPackage,
                restore: restore,
                deepCopy: deepCopy,
                nullable: 1,
                immutable: 1,
                action: 1,
                uiControl: 1
              },
              imguiRendererExtensionProtocolName
            ], clearColor);
}

function render(sandbox, getExtensionServiceOpt, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, uiExtensionProtocolNameOpt, imguiRendererExtensionProtocolNameOpt, meta3dStateOpt, timeOpt, param) {
  var getExtensionService;
  if (getExtensionServiceOpt !== undefined) {
    getExtensionService = Caml_option.valFromOption(getExtensionServiceOpt);
  } else {
    var __x = Sinon.createEmptyStub(sandbox.contents);
    getExtensionService = Sinon.returns(ImguiRendererServiceTool$Meta3dUi.buildService(sandbox, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined), __x);
  }
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  var uiExtensionProtocolName = uiExtensionProtocolNameOpt !== undefined ? uiExtensionProtocolNameOpt : "uiExtensionProtocolName";
  var imguiRendererExtensionProtocolName = imguiRendererExtensionProtocolNameOpt !== undefined ? imguiRendererExtensionProtocolNameOpt : "imguiRendererExtensionProtocolName";
  var meta3dState = meta3dStateOpt !== undefined ? meta3dStateOpt : 1;
  var time = timeOpt !== undefined ? timeOpt : 0;
  return UIManager$Meta3dUi.render({
              registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
              getExtensionService: getExtensionService,
              getExtensionState: getExtensionState,
              setExtensionState: setExtensionState,
              getPackageService: getPackageService,
              registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
              getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
              getAllContributesByType: getAllContributesByType,
              getPackage: getPackage,
              restore: restore,
              deepCopy: deepCopy,
              nullable: 1,
              immutable: 1,
              action: 1,
              uiControl: 1
            }, meta3dState, [
              uiExtensionProtocolName,
              imguiRendererExtensionProtocolName
            ], time);
}

function registerElement(state, elementFunc, elementNameOpt, execOrderOpt, elementStateOpt, param) {
  var elementName = elementNameOpt !== undefined ? elementNameOpt : "e1";
  var execOrder = execOrderOpt !== undefined ? execOrderOpt : 0;
  var elementState = elementStateOpt !== undefined ? Caml_option.valFromOption(elementStateOpt) : 1;
  return UIManager$Meta3dUi.registerElement(state, {
              elementName: elementName,
              execOrder: execOrder,
              elementFunc: elementFunc,
              elementState: elementState
            });
}

var markStateChange = UIManager$Meta3dUi._markStateChange;

var show = UIManager$Meta3dUi.show;

var hide = UIManager$Meta3dUi.hide;

function beginWindow(sandbox, label, getExtensionService, flagsOpt, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, imguiRendererExtensionProtocolNameOpt, meta3dStateOpt, param) {
  var flags = flagsOpt !== undefined ? flagsOpt : 0;
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  var imguiRendererExtensionProtocolName = imguiRendererExtensionProtocolNameOpt !== undefined ? imguiRendererExtensionProtocolNameOpt : "imguiRendererExtensionProtocolName";
  var meta3dState = meta3dStateOpt !== undefined ? meta3dStateOpt : 1;
  return UIManager$Meta3dUi.beginWindow(meta3dState, [
              {
                registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getExtensionService: getExtensionService,
                getExtensionState: getExtensionState,
                setExtensionState: setExtensionState,
                getPackageService: getPackageService,
                registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getAllContributesByType: getAllContributesByType,
                getPackage: getPackage,
                restore: restore,
                deepCopy: deepCopy,
                nullable: 1,
                immutable: 1,
                action: 1,
                uiControl: 1
              },
              imguiRendererExtensionProtocolName
            ], label, flags);
}

function endWindow(sandbox, getExtensionService, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, imguiRendererExtensionProtocolNameOpt, meta3dStateOpt, param) {
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  var imguiRendererExtensionProtocolName = imguiRendererExtensionProtocolNameOpt !== undefined ? imguiRendererExtensionProtocolNameOpt : "imguiRendererExtensionProtocolName";
  var meta3dState = meta3dStateOpt !== undefined ? meta3dStateOpt : 1;
  return UIManager$Meta3dUi.endWindow(meta3dState, [
              {
                registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getExtensionService: getExtensionService,
                getExtensionState: getExtensionState,
                setExtensionState: setExtensionState,
                getPackageService: getPackageService,
                registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getAllContributesByType: getAllContributesByType,
                getPackage: getPackage,
                restore: restore,
                deepCopy: deepCopy,
                nullable: 1,
                immutable: 1,
                action: 1,
                uiControl: 1
              },
              imguiRendererExtensionProtocolName
            ]);
}

function setNextWindowRect(sandbox, rect, getExtensionService, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, imguiRendererExtensionProtocolNameOpt, meta3dStateOpt, param) {
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  var imguiRendererExtensionProtocolName = imguiRendererExtensionProtocolNameOpt !== undefined ? imguiRendererExtensionProtocolNameOpt : "imguiRendererExtensionProtocolName";
  var meta3dState = meta3dStateOpt !== undefined ? meta3dStateOpt : 1;
  return UIManager$Meta3dUi.setNextWindowRect(meta3dState, [
              {
                registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getExtensionService: getExtensionService,
                getExtensionState: getExtensionState,
                setExtensionState: setExtensionState,
                getPackageService: getPackageService,
                registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getAllContributesByType: getAllContributesByType,
                getPackage: getPackage,
                restore: restore,
                deepCopy: deepCopy,
                nullable: 1,
                immutable: 1,
                action: 1,
                uiControl: 1
              },
              imguiRendererExtensionProtocolName
            ], rect);
}

function getFBOTexture(textureID, stateOpt, param) {
  var state = stateOpt !== undefined ? stateOpt : Main$Meta3dUi.createExtensionState(1, 1);
  return UIManager$Meta3dUi.getFBOTexture(state, textureID);
}

function setFBOTexture(textureID, texture, stateOpt, param) {
  var state = stateOpt !== undefined ? stateOpt : Main$Meta3dUi.createExtensionState(1, 1);
  return UIManager$Meta3dUi.setFBOTexture(state, textureID, texture);
}

function addFBOTexture(sandbox, getExtensionService, texture, rect, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, imguiRendererExtensionProtocolNameOpt, meta3dStateOpt, param) {
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  var imguiRendererExtensionProtocolName = imguiRendererExtensionProtocolNameOpt !== undefined ? imguiRendererExtensionProtocolNameOpt : "imguiRendererExtensionProtocolName";
  var meta3dState = meta3dStateOpt !== undefined ? meta3dStateOpt : 1;
  return UIManager$Meta3dUi.addFBOTexture(meta3dState, [
              {
                registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getExtensionService: getExtensionService,
                getExtensionState: getExtensionState,
                setExtensionState: setExtensionState,
                getPackageService: getPackageService,
                registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getAllContributesByType: getAllContributesByType,
                getPackage: getPackage,
                restore: restore,
                deepCopy: deepCopy,
                nullable: 1,
                immutable: 1,
                action: 1,
                uiControl: 1
              },
              imguiRendererExtensionProtocolName
            ], texture, rect);
}

function getContext(sandbox, getExtensionService, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, imguiRendererExtensionProtocolNameOpt, meta3dStateOpt, param) {
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  var imguiRendererExtensionProtocolName = imguiRendererExtensionProtocolNameOpt !== undefined ? imguiRendererExtensionProtocolNameOpt : "imguiRendererExtensionProtocolName";
  var meta3dState = meta3dStateOpt !== undefined ? meta3dStateOpt : 1;
  return UIManager$Meta3dUi.getContext(meta3dState, [
              {
                registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getExtensionService: getExtensionService,
                getExtensionState: getExtensionState,
                setExtensionState: setExtensionState,
                getPackageService: getPackageService,
                registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getAllContributesByType: getAllContributesByType,
                getPackage: getPackage,
                restore: restore,
                deepCopy: deepCopy,
                nullable: 1,
                immutable: 1,
                action: 1,
                uiControl: 1
              },
              imguiRendererExtensionProtocolName
            ]);
}

function button(sandbox, label, size, getExtensionService, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, imguiRendererExtensionProtocolNameOpt, meta3dStateOpt, param) {
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  var imguiRendererExtensionProtocolName = imguiRendererExtensionProtocolNameOpt !== undefined ? imguiRendererExtensionProtocolNameOpt : "imguiRendererExtensionProtocolName";
  var meta3dState = meta3dStateOpt !== undefined ? meta3dStateOpt : 1;
  return UIManager$Meta3dUi.button(meta3dState, [
              {
                registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getExtensionService: getExtensionService,
                getExtensionState: getExtensionState,
                setExtensionState: setExtensionState,
                getPackageService: getPackageService,
                registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
                getAllContributesByType: getAllContributesByType,
                getPackage: getPackage,
                restore: restore,
                deepCopy: deepCopy,
                nullable: 1,
                immutable: 1,
                action: 1,
                uiControl: 1
              },
              imguiRendererExtensionProtocolName
            ], label, size);
}

function registerUIControl(uiControlName, func, initOpt, stateOpt, param) {
  var init = initOpt !== undefined ? initOpt : (function (param) {
        return Promise.resolve(1);
      });
  var state = stateOpt !== undefined ? stateOpt : Main$Meta3dUi.createExtensionState(1, 1);
  return UIManager$Meta3dUi.registerUIControl(state, {
              uiControlName: uiControlName,
              func: func,
              init: init
            });
}

function buildSkinContribute(skinName, skin) {
  return {
          skinName: skinName,
          skin: skin
        };
}

function registerSkin(skinName, skin, stateOpt, param) {
  var state = stateOpt !== undefined ? stateOpt : Main$Meta3dUi.createExtensionState(1, 1);
  return UIManager$Meta3dUi.registerSkin(state, {
              skinName: skinName,
              skin: skin
            });
}

function deepCopy(sandbox, meta3dState, getExtensionService, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, param) {
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy$1 = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  return UIManager$Meta3dUi.deepCopy({
              registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
              getExtensionService: getExtensionService,
              getExtensionState: getExtensionState,
              setExtensionState: setExtensionState,
              getPackageService: getPackageService,
              registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
              getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
              getAllContributesByType: getAllContributesByType,
              getPackage: getPackage,
              restore: restore,
              deepCopy: deepCopy$1,
              nullable: 1,
              immutable: 1,
              action: 1,
              uiControl: 1
            }, meta3dState);
}

function restore(sandbox, currentMeta3dState, targetMeta3dState, getExtensionService, getPackageServiceOpt, getAllContributesByTypeOpt, getExtensionStateOpt, setExtensionStateOpt, getPackageOpt, restoreOpt, deepCopyOpt, param) {
  var getPackageService = getPackageServiceOpt !== undefined ? Caml_option.valFromOption(getPackageServiceOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getAllContributesByType = getAllContributesByTypeOpt !== undefined ? Caml_option.valFromOption(getAllContributesByTypeOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getExtensionState = getExtensionStateOpt !== undefined ? Caml_option.valFromOption(getExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var setExtensionState = setExtensionStateOpt !== undefined ? Caml_option.valFromOption(setExtensionStateOpt) : Sinon.createEmptyStub(sandbox.contents);
  var getPackage = getPackageOpt !== undefined ? Caml_option.valFromOption(getPackageOpt) : Sinon.createEmptyStub(sandbox.contents);
  var restore$1 = restoreOpt !== undefined ? Caml_option.valFromOption(restoreOpt) : Sinon.createEmptyStub(sandbox.contents);
  var deepCopy = deepCopyOpt !== undefined ? Caml_option.valFromOption(deepCopyOpt) : Sinon.createEmptyStub(sandbox.contents);
  return UIManager$Meta3dUi.restore({
              registerExtension: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
              getExtensionService: getExtensionService,
              getExtensionState: getExtensionState,
              setExtensionState: setExtensionState,
              getPackageService: getPackageService,
              registerContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
              getContribute: Sinon.createEmptyStubWithJsObjSandbox(sandbox),
              getAllContributesByType: getAllContributesByType,
              getPackage: getPackage,
              restore: restore$1,
              deepCopy: deepCopy,
              nullable: 1,
              immutable: 1,
              action: 1,
              uiControl: 1
            }, currentMeta3dState, targetMeta3dState);
}

var isStateChange = UIManager$Meta3dUi.isStateChange;

var getUIControlState = UIManager$Meta3dUi.getUIControlState;

var setUIControlState = UIManager$Meta3dUi.setUIControlState;

var getUIControlFuncExn = UIManager$Meta3dUi.getUIControlFuncExn;

var getSkin = UIManager$Meta3dUi.getSkin;

var updateElementState = UIManager$Meta3dUi.updateElementState;

var getElementState = UIManager$Meta3dUi.getElementState;

var getCurrentElementState = UIManager$Meta3dUi.getCurrentElementState;

exports.createState = createState;
exports.init = init;
exports.clear = clear;
exports.render = render;
exports.registerElement = registerElement;
exports.markStateChange = markStateChange;
exports.isStateChange = isStateChange;
exports.show = show;
exports.hide = hide;
exports.beginWindow = beginWindow;
exports.endWindow = endWindow;
exports.setNextWindowRect = setNextWindowRect;
exports.getFBOTexture = getFBOTexture;
exports.setFBOTexture = setFBOTexture;
exports.addFBOTexture = addFBOTexture;
exports.getContext = getContext;
exports.button = button;
exports.registerUIControl = registerUIControl;
exports.getUIControlState = getUIControlState;
exports.setUIControlState = setUIControlState;
exports.getUIControlFuncExn = getUIControlFuncExn;
exports.buildSkinContribute = buildSkinContribute;
exports.registerSkin = registerSkin;
exports.getSkin = getSkin;
exports.updateElementState = updateElementState;
exports.getElementState = getElementState;
exports.deepCopy = deepCopy;
exports.restore = restore;
exports.getCurrentElementState = getCurrentElementState;
/* Sinon Not a pure module */
