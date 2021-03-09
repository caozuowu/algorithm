
/*
    https://leetcode-cn.com/problems/jump-game/
    给定一个非负整数数组 nums ，你最初位于数组的 第一个下标 。
    数组中的每个元素代表你在该位置可以跳跃的最大长度。
    判断你是否能够到达最后一个下标。
    输入：nums = [2,3,1,1,4]
    输出：true
    解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
 */

boolean_t canJump(NSArray<NSNumber *> * nums) {
    //maxLength 当前位置可以到达最远距离
    int maxLength = 0;
    for (int i = 0 ; i < nums.count; i++) {
        if (maxLength < i) return false;
        maxLength = MAX(maxLength, [nums[i] intValue] + i);
        if (maxLength >= nums.count-1) return true;
    }
    return false;
}
