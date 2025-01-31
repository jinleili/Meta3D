"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.hasIntersect = exports.intersect = exports.removeDuplicateItems = exports.removeDuplicateItemsWithBuildKeyFunc = void 0;
let removeDuplicateItemsWithBuildKeyFunc = (arr, buildKeyFunc) => {
    var resultArr = [];
    // var map = MutableHashMap$Meta3dCommonlib.createEmpty(undefined, undefined);
    var map = {};
    for (var i = 0, i_finish = arr.length; i < i_finish; ++i) {
        var item = arr[i];
        var key = buildKeyFunc(item);
        // var match = MutableHashMap$Meta3dCommonlib.get(map, key);
        var match = map[key];
        if (match !== undefined) {
        }
        else {
            // Js_array.push(item, resultArr);
            // MutableHashMap$Meta3dCommonlib.set(map, key, item);
            resultArr.push(item);
            map[key] = item;
        }
    }
    return resultArr;
};
exports.removeDuplicateItemsWithBuildKeyFunc = removeDuplicateItemsWithBuildKeyFunc;
let removeDuplicateItems = (arr) => {
    return (0, exports.removeDuplicateItemsWithBuildKeyFunc)(arr, (key) => key);
};
exports.removeDuplicateItems = removeDuplicateItems;
let intersect = (arr1, arr2) => arr1.filter((value) => arr2.includes(value));
exports.intersect = intersect;
let hasIntersect = (arr1, arr2) => (0, exports.intersect)(arr1, arr2).length > 0;
exports.hasIntersect = hasIntersect;
//# sourceMappingURL=ArrayUtils.js.map