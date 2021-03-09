

var TreeNode = function(val, left, right) {

    var WalkType = {
        pre:    'pre',
        middle: 'middle',
        post:   'post',
        layer:  'layer'
    }

    this.val = val
    this.left = left;
    this.right = right;

    this.walk = function(type) {
        if (type == WalkType.pre) {
            console.log(this.preWalk())
        } else if (type == WalkType.middle) {
            console.log(this.middleWale());
        }else if (type == WalkType.layer) {
            console.log(this.layerWalk())
        }      
    }
    
    this.preWalk = function() {
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

    this.middleWale = function() {

        var result = []

        if (this.left) {
            result.push(this.left.middleWale())
        }

        result.push(this.val);

        if (this.right) {
            result.push(this.right.middleWale())
        }

        return result;
    }

    this.layerWalk = function () {
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

    this.stackWalk = function() {

        var result = [];
        var stack = [this]

        while (stack.length) {

            var n = stack.pop()
            result.push(n.val)

            if (n.right) {
                stack.push(n.right)
            }

            if (n.left) {
                stack.push(n.left)
            }

        }

        console.log(result)
    }

    this.depth = function() {
        if (!this.left && !this.right) {
            return 1
        }else {
            var ld = this.left.depth() + 1
            var rd = this.right.depth() + 1
            return ld > rd ? ld : rd
        }
    }
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
var root = createTree(array, 0, 8);
// root.walk('layer')
root.walk('pre')
root.stackWalk()

module.exports = {
    TreeNode: TreeNode,
    createTree: createTree
}



