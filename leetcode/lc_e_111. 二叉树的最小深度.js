

var tree = require("../module/tree");
var TreeNode = tree.TreeNode
var array = [1,2,3,4,5,6,7,8,9]
var root = tree.createTree(array, 0, array.length-1);

root.walk('layer')
root.walk('pre')

var minDepth = function(root)  {
    if (!root) {
        return 0
    }else if (!root.left && !root.right){
        return 1;
    }

    var min = Infinity;
    
    if (root.left) {
        min = Math.min(min, minDepth(root.left))
    }
    if (root.right) {
        min = Math.min(min, minDepth(root.right))
    }

    return min
}

console.log(minDepth(root))