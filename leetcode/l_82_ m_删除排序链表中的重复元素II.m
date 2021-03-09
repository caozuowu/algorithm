

/*
    给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。
    https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/
 */

#import <Foundation/Foundation.h>

@interface ListNode : NSObject
@property (nonatomic, strong) ListNode * next;
@property (nonatomic, assign) int val;
@end

ListNode * deleteDuplicates(ListNode * head) {
    
    ListNode * result = [[ListNode alloc] init];
    result.val = 0;
    result.next = head;
    
    ListNode * prev = result;
    ListNode * cur = result.next;
    
    while (cur) {
        
        int count = 0;
        ListNode * p = cur;
        while (p && p.val == p.next.val) {
            count++;
            p = p.next;
        }
        
        if (count > 1) {
            prev.next = p;
        }else {
            prev = cur;
        }
        cur = p;
    }
    
    return result.next;
}

