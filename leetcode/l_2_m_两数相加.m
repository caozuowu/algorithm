
/*
 * https://leetcode-cn.com/problems/add-two-numbers/
 * 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 * 请你将两个数相加，并以相同形式返回一个表示和的链表。
 */

#import <Foundation/Foundation.h>

@interface ListNode : NSObject
@property (assign, nonatomic) int val;
@property (strong, nonatomic) ListNode * next;
@end

ListNode * addTwoNumbers(ListNode * p1, ListNode * p2) {
    
    ListNode * head = nil;
    ListNode * tail = nil;
    
    int carry = 0;
    
    while (p1 || p2) {
        
        int n1 = p1 ? p1.val : 0;
        int n2 = p2 ? p2.val : 0;
        
        int sum = n1 + n2 + carry;
        if (!head) {
            head =  tail = [[ListNode alloc] init];
            head.val = sum % 10;
        }else {
            tail.next = [[ListNode alloc] init];
            tail = tail.next;
            tail.val = sum % 10;
        }
        
        carry = (int)sum/10;
        
        if (p1) {
            p1 = p1.next;
        }
        if (p2) {
            p2 = p2.next;
        }
    }
    
    if (carry > 0) {
        tail.next = [[ListNode alloc] init];
        tail.val = carry;
    }
    return head;
}
