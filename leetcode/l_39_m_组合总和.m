

/*
    https://leetcode-cn.com/problems/combination-sum/
    给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合
*/

#import <Foundation/Foundation.h>
//不允许重复需要排序
void deepSearch(NSMutableArray * result, NSMutableArray * array, NSArray * candidates, NSInteger start, NSInteger target) {
    
    if (target <= 0) {
        if (target == 0) {
            [result addObject:[array copy]];
        }
        return;
    }
    
    for (NSInteger i = start; i < candidates.count; i++) {
        [array addObject: candidates[i]];
        //允许重i 不允许重复i+1
        deepSearch(result, array, candidates, i, target- [candidates[i] intValue]);
        [array removeLastObject];
    }
}

NSMutableArray * combinationSum(NSMutableArray * result, NSArray * candidates, int target ) {
    deepSearch(result, [NSMutableArray array], candidates, 0, target);
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray * result = [NSMutableArray array];
        NSArray * candidates = @[@2,@3,@6,@7];
        combinationSum(result, candidates, 7);
        NSLog(@"%@", result);
    }
    return 0;
}
