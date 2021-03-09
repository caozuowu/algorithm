

/*
给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。
https://leetcode-cn.com/problems/permutations-ii/
*/


#import <Foundation/Foundation.h>


void arragement(NSMutableArray * array, NSInteger start, NSInteger end, NSMutableArray * result) {
    
    if (start == end) {
        [result addObject:[array copy]];
        return;
    }
    
    //如果有重复元素需要在当前层加入去重复map判断
    for (NSInteger i = start; i < end; i++) {
        [array exchangeObjectAtIndex:start withObjectAtIndex:i];
        arragement(array, i+1, end, result);
        [array exchangeObjectAtIndex:start withObjectAtIndex:i];
    }

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSMutableArray * result = [NSMutableArray array];
        NSMutableArray * arr = [NSMutableArray arrayWithArray:@[@1,@2,@3,@4,@5]];
        arragement(arr, 0, arr.count, result);
        NSLog(@"%@",result);
    }
    return 0;
}
