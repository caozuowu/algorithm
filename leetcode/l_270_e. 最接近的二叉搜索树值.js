

//给定一个不为空的二叉搜索树和一个目标值 target，请在该二叉搜索树中找到最接近目标值 target 的数值。

var tree = require("../module/tree");
var TreeNode = tree.TreeNode
var array = [1,2,3,4,5,6,7,8,9]
var root = tree.createTree(array, 0, array.length-1);
  
var closestValue = function(root, target) {
    var temp = root;
    var closest = root.val
    while (temp) {
        var val = temp.val;
        closest = Math.abs(val-target) < Math.abs(closest-target) ? val : closest
        temp = val < root.val ? temp.left:temp.right
    }
    return closest
};
