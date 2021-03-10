
nums = [10,9,2,5,3,7,101,18]

var lengthOfLIS = function(nums) {
    var length = nums.length;
    var dp = new Array(length)
    dp.fill(1)
    var lm = 1;
    dp[0] = 1
    for (var i = 1; i < length; i++) {
        for (var j = 0; j < i ; j++) {
            //以 i 为结尾的序列的长度应该为i本身的长度 或者 i之前某个最大序列的长度+1(因为做了nums[j] < nums[i])判断
            if (nums[j] < nums[i]) {
                dp[i] = Math.max(dp[i], dp[j] + 1)
            }
        }
        lm = Math.max(lm, dp[i])
    }
    return lm
};

console.log(lengthOfLIS(nums))