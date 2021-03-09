

var tree = require("../module/tree");
var TreeNode = tree.TreeNode
var array = [1,2,3,4,5,6,7,8,9]
var root = tree.createTree(array, 0, array.length-1);

root.walk('layer')

var lowestCommonAncestor = function(root, p, q) {

    var temp = root;

    while (true) {
        if (p.val < root.val && q.val < root.val) {
            temp = temp.left
        } else if (p.val > root.val && q.val > root.val) {
            temp = temp.right
        } else {
            break
        }
    }

    return temp;
    
};

lowestCommonAncestor(root, 3,6)