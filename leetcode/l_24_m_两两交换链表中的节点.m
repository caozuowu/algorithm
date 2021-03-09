/*
    https://leetcode-cn.com/problems/swap-nodes-in-pairs/
    24. 两两交换链表中的节点
*/

#import <Foundation/Foundation.h>

@interface ListNode : NSObject
@property (strong, nonatomic) ListNode * next;
@property (assign, nonatomic) int val;
@end

ListNode * swapPairs(ListNode * head) {
    ListNode * dummyHead = [[ListNode alloc] init];
    dummyHead.next = head;
    ListNode * temp = dummyHead;
    while (temp.next && temp.next.next) {
        ListNode * n1 = temp.next;
        ListNode * n2 = temp.next.next;
        temp.next = n2;
        n1.next = n2.next;
        n2.next = n1;
        temp = n1;
    }
    return dummyHead.next;
}