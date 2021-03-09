
var tree = require("../module/tree");
var TreeNode = tree.TreeNode

var inorder = [1,3,2]
var postorder = [3,2,1]

var buildTree = function(inorder, postorder) {
    
    if (inorder.length == 0) {
        return null;
    }else {
        var value = postorder.pop()
        var node = new TreeNode(value);
        var inorderIndex = inorder.indexOf(value)
        var leftLength = inorderIndex;
        var rightLength = inorder.length - 1 - inorderIndex;
        node.left = buildTree(inorder.slice(0, leftLength), postorder.slice(0,leftLength));
        node.right = buildTree(inorder.slice(leftLength+1,inorder.length), postorder.slice(leftLength, postorder.length))
        return node
    }
};

var node = buildTree(inorder, postorder);
node.walk('layer')