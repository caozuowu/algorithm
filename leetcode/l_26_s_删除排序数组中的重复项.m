
/*
    26. 删除排序数组中的重复项
    https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/
*/

#import <Foundation/Foundation.h>

void removeDuplicates(NSMutableArray * nums) {
    for (NSInteger i = nums.count - 1; i >= 1; i--) {
        if ([nums[i] intValue] == [nums[i-1] intValue]) {
            [nums removeObjectAtIndex:i];
        }
    }
}