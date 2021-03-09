
/*
    https://leetcode-cn.com/problems/longest-common-prefix/
    编写一个函数来查找字符串数组中的最长公共前缀。
    如果不存在公共前缀，返回空字符串 ""。
 */


#import <Foundation/Foundation.h>

NSString * longestCommonPrefix(NSArray<NSString *> * strs, NSInteger start, NSInteger end) {
    
    if (start == end) {
        return strs[start];
    }else {
        NSInteger mid = (start + end)/2;
        NSString * left = longestCommonPrefix(strs, start, mid);
        NSString * right = longestCommonPrefix(strs, mid+1, end);
        
        NSInteger length = MIN(left.length, right.length);
        for (NSInteger i = 0; i < length; i++) {
            NSString * char_left = [left substringWithRange:NSMakeRange(i, 1)];
            NSString * char_right = [left substringWithRange:NSMakeRange(i, 1)];
            if (![char_left isEqualToString:char_right]) {
                return [left substringWithRange:NSMakeRange(0, i-0)];
            }
        }
        return [left substringWithRange:NSMakeRange(0, length-0)];
    }
}