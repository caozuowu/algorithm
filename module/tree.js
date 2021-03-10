

var TreeNode = function(val, left, right) {
    this.val = val
    this.left = left;
    this.right = right;
}

TreeNode.prototype.walk = function(type) {
    if (type == 'pre') {
        console.log(this.preWalk())
    } else if (type == 'middle') {
        console.log(this.middleWalk());
    }else if (type == 'layer') {
        console.log(this.layerWalk())
    }      
}

TreeNode.prototype.depth = function() {
    if (!this.left && !this.right) {
        return 1
    }else {
        var ld = this.left.depth() + 1
        var rd = this.right.depth() + 1
        return ld > rd ? ld : rd
    }
}

TreeNode.prototype.preWalk = function() {
    var result = []
    if (this.left) {
        result.push(this.left.preWalk())
    }
    if (this.right) {
        result.push(this.right.preWalk())
    }

    result.push(this.val);
    return result;
}

TreeNode.prototype.middleWalk = function() {

    var result = []

    if (this.left) {
        result.push(this.left.middleWalk())
    }

    result.push(this.val);

    if (this.right) {
        result.push(this.right.middleWalk())
    }

    return result;
}

TreeNode.prototype.layerWalk = function () {
    var queue = [this];
    var result = [];
    while (queue.length > 0) {
        var line = []
        var length = queue.length
        for (var i = 0; i < length ; i++) {
            var n = queue.shift()
            line.push(n.val)
            if (n.left) {
                queue.push(n.left)
            }
            if (n.right) {
                queue.push(n.right)
            }
        }
        result.push(line)
    }
    return result;
}

TreeNode.prototype.stackWalk = function() {

    var result = [];
    var stack = []
    var p = this;

    while (stack.length || p) {
        
        while (p) {
            stack.push(p)
            result.push(p.val)
            p = p.left
        }

        p = stack.pop().right
    }

    console.log(result)
}

var createTree = function(array, left, right) {
    if (left <= right) {
        var mid = Math.floor((left + right)/2);
        var node = new TreeNode(array[mid]);
        node.left = createTree(array,left, mid-1)
        node.right = createTree(array,mid+1, right)
        return node
    }else {
        return undefined
    }
}

// test code
var array = [1,2,3,4,5]
var root = createTree(array, 0, 4);
root.walk('layer')
root.walk('pre')
root.stackWalk()



module.exports = {
    TreeNode: TreeNode,
    createTree: createTree
}



