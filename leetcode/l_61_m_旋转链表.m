

/*
    https://leetcode-cn.com/problems/rotate-list/
    给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。
 */

#import <Foundation/Foundation.h>

@interface ListNode : NSObject
@property (nonatomic, assign) int val;
@property (nonatomic, strong) ListNode * next;
@end

ListNode * rotateRight(ListNode * head, int k) {
    ListNode * oldTail = head;
    int count = 0;
    while (oldTail.next) {
        oldTail = oldTail.next;
        count ++;
    }
    oldTail.next = head;
    ListNode * newTail = head;
    //可能会绕圈
    for (int i = 0; i < k%(count-1); i++) {
        newTail = newTail.next;
    }
    ListNode * newHead = newTail.next;
    newTail.next = nil;
    return newHead;
}

