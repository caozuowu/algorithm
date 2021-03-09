


/*
 * https://leetcode-cn.com/problems/longest-palindromic-substring/
 * 给你一个字符串 s，找到 s 中最长的回文子串。
 */

#import <Foundation/Foundation.h>

NSString * longestPalindrome(NSString * s) {
    
    NSMutableArray * mark = [NSMutableArray arrayWithArray:@[]];
    for (NSInteger i = 0; i < s.length ; i++) {
        NSMutableArray * arr = [NSMutableArray arrayWithArray:@[]];
        for (NSInteger j = 0 ; j < s.length ; j ++) {
            [arr addObject:@0];
        }
        [mark addObject:arr];
    }
    
    NSString * result = @"";
    
    for (NSInteger l = 0 ; l < s.length; l ++) {
        for (NSInteger i = 0; i < s.length - l; i++) {
            NSInteger j = i + l;
            if (l == 0) {
                mark[i][j] = @YES;
            }else if (l == 1) {
                NSString * char_i = [s substringWithRange:NSMakeRange(i, 1)];
                NSString * char_j = [s substringWithRange:NSMakeRange(j, 1)];
                BOOL b = [char_i isEqualToString:char_j];
                mark[i][j] = [NSNumber numberWithBool:b];
            }else {
                NSString * char_i = [s substringWithRange:NSMakeRange(i, 1)];
                NSString * char_j = [s substringWithRange:NSMakeRange(j, 1)];
                BOOL b = [char_i isEqualToString:char_j];
                mark[i][j] = [NSNumber numberWithBool: [mark[i+1][j-1] boolValue] && b];
            }
            
            if ([mark[i][j] boolValue] && l+1 > result.length) {
                result = [s substringWithRange:NSMakeRange(i, l)];
            }
            
        }
    }
    
    NSLog(@"%@", mark);
    
    return result;
}
