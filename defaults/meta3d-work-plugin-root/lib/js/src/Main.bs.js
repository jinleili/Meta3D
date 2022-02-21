'use strict';

var InitJob$Meta3dWorkPluginRoot = require("./jobs/InitJob.bs.js");

function _getExecFunc(_pipelineName, jobName) {
  if (jobName === "init_root_meta3d") {
    return InitJob$Meta3dWorkPluginRoot.exec;
  } else {
    return null;
  }
}

function _init(_state) {
  
}

function getWorkPluginContribute(mostService) {
  return {
          pluginName: "meta3d-work-plugin-root",
          createStateFunc: (function (param) {
              return {
                      mostService: mostService
                    };
            }),
          initFunc: _init,
          getExecFunc: _getExecFunc,
          allPipelineData: [{
              name: "init",
              groups: [{
                  name: "first_root_meta3d",
                  link: "concat",
                  elements: [{
                      name: "init_root_meta3d",
                      type_: "job"
                    }]
                }],
              first_group: "first_root_meta3d"
            }]
        };
}

exports._getExecFunc = _getExecFunc;
exports._init = _init;
exports.getWorkPluginContribute = getWorkPluginContribute;
/* No side effect */
