

var tree = require("../module/tree");
var TreeNode = tree.TreeNode
// var array = [1,2,3,4,5,6,7,8,9]
// var root = tree.createTree(array, 0, array.length-1);

var lowestCommonAncestor = function(root, p, q) {

    if (root == p|| root == q) {
        return root;
    }
    
    if (root) {
        var leftNode = lowestCommonAncestor(root.left, p, q);
        var rightNode = lowestCommonAncestor(root.right, p, q);
      
        
        if (leftNode && rightNode) {
            //从树根向下搜索,两侧的子节点都没有包含p和q 找到
            return root
        }else if(!leftNode){
            //都在右边
            return lowestCommonAncestor(rightNode, p, q)
        }else {
            //都在左边
            return lowestCommonAncestor(leftNode, p, q)
        }
    }
    return null
    
};