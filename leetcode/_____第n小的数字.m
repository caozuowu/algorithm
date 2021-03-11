

#import <Foundation/Foundation.h>


NSInteger PARTITION(NSMutableArray<NSNumber *> * Arr, NSInteger left, NSInteger right){
    NSInteger j = left-1;
    for (NSInteger i = left; i < right; i++) {
        if ([Arr[i] intValue] < [Arr[right] intValue]) {
            j++;
            [Arr exchangeObjectAtIndex:i withObjectAtIndex:j];
            
        }
    }
    j++;
    [Arr exchangeObjectAtIndex:right withObjectAtIndex:j];
    return j;
}

NSInteger MinAt(NSMutableArray * Arr, NSInteger left, NSInteger right, NSInteger i) {

    NSInteger q = PARTITION(Arr, left, right);
    if (q == i) {
        return [Arr[q] intValue];
    }else if (q < i) {
        return MinAt(Arr, q+1, right, i);
    }else {
        return MinAt(Arr, left, right-1, i);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray * arr = [NSMutableArray arrayWithArray:@[@5,@6,@7,@1,@2,@3,@4]];
        PARTITION(arr,0,arr.count-1);
        NSLog(@"%d",MinAt(arr, 0, arr.count-1, 2));
    }
    return 0;
}