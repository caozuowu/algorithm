

// 给定一个包含 非负数 的数组和一个目标 整数 k，
// 编写一个函数来判断该数组是否含有连续的子数组，其大小至少为 2，且总和为 k 的倍数，
// 即总和为 n*k，其中 n 也是一个整数。
// [23,2,4,6,7], k = 6
var nums = [23,2,4,6,7];
var k = 6
var checkSubarraySum = function(nums, k) {
    var sum = 0;
    var map = {0:-1}
    for (var i = 0; i < nums.length; i++) {
        sum += nums[i]
        sum %= k;
        if (map[sum]) {
            //上一个地址
           if (i - map[sum] > 1) {
               return true
           }
        }else {
            map[sum] = i
        }
    }
    return false
};

console.log(checkSubarraySum(nums, k))