

// 给定一个包含 非负数 的数组和一个目标 整数 k，
// 编写一个函数来判断该数组是否含有连续的子数组，其大小至少为 2，且总和为 k 的倍数，
// 即总和为 n*k，其中 n 也是一个整数。
// [23,2,4,6,7], k = 6
var nums = [23,2,4,6,7];
var k = 6
var checkSubarraySum = function(nums, k) {
    var length = nums.length
    var dp = new Array(length)
    for (var i = 0; i < length; i++) {
        dp[i] = new Array(length)
    }

    for (var l = 0; l < length; l++) {
        for (var i = 0; i < length-l; i++) {
            var j = i+l
            console.log('i == ', i, 'j == ', j)
            if (l == 0) {
                dp[i][j] = nums[i]
            }else if (l == 1) {
                dp[i][j] = nums[i] + nums[j]
                if (dp[i][j] % 6 == 0) {
                    return true
                } 
            }else {
                // dp[i][j] = 
            }
        }
    }

    console.log(dp)
};

console.log(checkSubarraySum(nums, k))