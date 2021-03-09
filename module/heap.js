
var heap = function(array) {
    this.array = array
    this.right = function(i) {
        return i*2
    }
    this.left = function(i) {
        return i*2-1
    }
}