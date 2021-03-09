


/*
 * 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
https://leetcode-cn.com/problems/3sum/
 */
#import <Foundation/Foundation.h>

NSArray * threeSum(NSArray<NSNumber *> * nums) {
    
    NSMutableArray * result = [NSMutableArray arrayWithArray:@[]];
    
    NSArray * arr = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 intValue] > [obj2 intValue];
    }];
    
    for (NSInteger first = 0 ; first < arr.count ; first++) {
        
        if (first > 0 && [nums[first] intValue] == [nums[first-1] intValue]) {
            continue;
        }
        
        NSInteger target = -[nums[first] intValue];
        NSInteger third = arr.count-1;
        
        for (NSInteger second = first+1; second < arr.count ; second++) {
            
            if (second > first+1 && [nums[second] intValue] == [nums[second-1] intValue]) {
                continue;
            }
            
            while (second < third && [arr[second] intValue] + [arr[third] intValue] > target) {
                third--;
            }
            
            if (second == third) {
                break;
            }
            
            if ([arr[second] intValue] + [arr[third] intValue] == target) {
                [result addObject:@[arr[first],arr[second],arr[third]]];
            }
        }
    }
    
    return result;
}
