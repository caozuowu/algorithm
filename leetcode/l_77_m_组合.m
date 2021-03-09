

/*
    https://leetcode-cn.com/problems/combinations/
    给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。
 */

#import <Foundation/Foundation.h>

void combineSub(int start,int k, int n, NSMutableArray * temp, NSMutableArray * reslut) {
    if (temp.count == k) {
        [reslut addObject:[temp copy]];
        return;
    }
    for (int i = start; i < n; i++) {
        [temp addObject:[NSNumber numberWithInt:i]];
        combineSub(i+1, k, n, temp, reslut);
        [temp removeLastObject];
    }
}

NSMutableArray * combine(int n, int k) {
    NSMutableArray * temp = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * reslut = [NSMutableArray arrayWithCapacity:0];
    combineSub(0, k, n, temp, reslut);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        combine(4,2);
    }
    return 0;
}
