
/*
    https://leetcode-cn.com/problems/subsets/
    给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。
    解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
 */

#import <Foundation/Foundation.h>

void deepSearch(int start, NSArray<NSNumber *> * nums, NSMutableArray * temp, NSMutableArray * result) {
    
    [result addObject: [temp copy]];
    
    for (int i = start; i < nums.count; i++) {
        [temp addObject: nums[i]];
        deepSearch(i+1, nums, temp, result);
        [temp removeLastObject];
    }
}

void subsets(NSArray<NSNumber *> * nums) {
    NSMutableArray * result = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * temp = [NSMutableArray arrayWithCapacity:0];
    deepSearch(0, nums, temp, result);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        subsets(@[@1,@2,@3]);
    }
    return 0;
}
