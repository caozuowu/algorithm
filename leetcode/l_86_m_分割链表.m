
/*
    给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。
    你应当 保留 两个分区中每个节点的初始相对位置。
*/

#import <Foundation/Foundation.h>

@interface ListNode : NSObject
@property (nonatomic, strong) ListNode * next;
@property (nonatomic, assign) int val;
@end

ListNode * partition(ListNode * head, int x) {
    
    ListNode * small = [[ListNode alloc] init];
    ListNode * smallHead = small;
    
    ListNode * large = [[ListNode alloc] init];
    ListNode * largeHead = large;
    
    while (head) {
        
        if (head.val < x) {
            small.next = head;
            small = small.next;
        }else {
            large.next = head;
            large = large.next;
        }
        
        head = head.next;
    }
    
    large.next = nil;
    small.next = largeHead.next;
    
    return smallHead.next;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
