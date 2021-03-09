

      +
  *      c
a   b

a*b + c*d + d + d

var creat = function(arr) {
    var mid = arr[arr.length/2];
    if (!mid) {
        return null
    }else {
        var node = new Node(mid)
        mid.left = crate(arr[0, mid])
        mid.right = crate(arr,[mid+1, arr.length-1])
    }
}

//FBKvoController