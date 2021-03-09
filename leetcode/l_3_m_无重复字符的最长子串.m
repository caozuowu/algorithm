

/*
 * https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
 * 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 */

#import <Foundation/Foundation.h>

NSInteger lengthOfLongestSubstring(NSString * s) {
    
    NSMutableDictionary<NSString *, NSString *> * set = [NSMutableDictionary dictionaryWithDictionary:@{}];
    NSInteger left = 0;
    NSInteger right = 0;
    NSInteger max = 0;
    
    for (left = 0; left < s.length ; left++) {
        
        if (left > 0) {
            NSString * leftChar = [s substringWithRange:NSMakeRange(left, 1)];
            if ([set objectForKey:leftChar]) {
                [set removeObjectForKey:leftChar];
            }
        }
        
        while (right < s.length && ![set objectForKey:[s substringWithRange:NSMakeRange(right, 1)]]) {
            [set setObject:@"true" forKey:[s substringWithRange:NSMakeRange(right, 1)]];
            right++;
        }
        
        NSInteger length = right - left;
        max = length > max ? length : max;
        
    }
    return max;
}
