
/*
    https://leetcode-cn.com/problems/generate-parentheses/
    数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
*/

#import <Foundation/Foundation.h>

Boolean valid(NSString * str) {
    int balance = 0;
    for (int i = 0; i < str.length; i++) {
        NSString * c = [str substringWithRange:NSMakeRange(i, 1)];
        if ([c isEqualToString:@"("]) {
            balance++;
        }else {
            balance--;
        }
        if (balance < 0) {
            return false;
        }
    }
    return balance == 0;
}

void generateAll(NSString * str, int n, NSMutableArray * result) {
    if (str.length == n) {
        if (valid(str)) {
            [result addObject:str];
        }
        return;
    }
    generateAll([NSString stringWithFormat:@"%@%@",str,@"("], n, result);
    generateAll([NSString stringWithFormat:@"%@%@",str,@")"], n, result);
}

NSArray * generateParenthesis(int n) {
    NSMutableArray * result = [NSMutableArray arrayWithArray:@[]];
    generateAll(@"", n*2, result);
    return result;
}