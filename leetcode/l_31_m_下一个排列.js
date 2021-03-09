

/*
    https://leetcode-cn.com/problems/next-permutation/
    实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
    如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
*/

var swap = function(nums, i, j) {
    var temp = nums[i];
    nums[i] = nums[j];
    nums[j] = temp;
}

var reverse = function (nums, left, right) {
    while (left < right) {
        swap(nums, left, right);
        left++;
        right--;
    }
}

var nextPermutation = function(nums) {
    var i = nums.length-2;
    while (i > 0 && nums[i] >= nums[i+1]) {
        i--;
    }
    if (i > 0) {
        var j = nums.length-1;
        while (j >=0 && nums[j] <= nums[i]) {
            j--;
        }
        swap(nums,i,j)
    }
    reverse(nums,i+1,nums.length-1)
}