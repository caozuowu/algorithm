


var tree = require("../module/tree");
var TreeNode = tree.TreeNode
var array = [1,2,3,4,5,6,7,8,9]
var root = tree.createTree(array, 0, array.length-1);

var verify = function(root, min, max) {
    if (root === null) {
        return true
    }else if (root.val <= min || root.val >= max) {
        return false
    }
    return verify(root.left, min, root.val) && verify(root.right, root.val, max)
}

var isValidBST = function(root) {
    return verify(root, -Infinity, Infinity)
}

