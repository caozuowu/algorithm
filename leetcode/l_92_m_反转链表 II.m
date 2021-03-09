

/*
    反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
    https://leetcode-cn.com/problems/reverse-linked-list-ii/solution/
*/

@interface ListNode : NSObject
@property (nonatomic, strong) ListNode * next;
@property (nonatomic, assign) int val;
@end

ListNode * reverse(ListNode * head) {
    
    ListNode * pNode = head;
    ListNode * pPrev = nil;
    ListNode * result = nil;
    
    while (pNode) {
        ListNode * pNext = pNode.next;
        if (pNext == nil) {
            result = pNode;
        }
        pNode.next = pPrev;
        pPrev = pNode;
        pNode = pNext;
    }
    return result;
}


ListNode * reverseBetween(ListNode * head, int m, int n) {
    
    ListNode * pNode = head;
    
    if (m > 1) {
        m--;
        n--;
        pNode = pNode.next;
    }
    
    ListNode * pPrev = pNode;

    while (n > 0) {
        ListNode * pNext = pNode.next;
        pNode.next = pPrev;
        pPrev = pNode;
        pNode = pNext;
        n--;
    }
    
    return head;
}


class Solution {
    public ListNode reverseBetween(ListNode head, int m, int n) {

        // Empty list
        if (head == null) {
            return null;
        }

        // Move the two pointers until they reach the proper starting point
        // in the list.
        ListNode cur = head, prev = null;
        while (m > 1) {
            prev = cur;
            cur = cur.next;
            m--;
            n--;
        }

        // The two pointers that will fix the final connections.
        ListNode con = prev, tail = cur;

        // Iteratively reverse the nodes until n becomes 0.
        ListNode third = null;
        while (n > 0) {
            third = cur.next;
            cur.next = prev;
            prev = cur;
            cur = third;
            n--;
        }

        // Adjust the final connections as explained in the algorithm
        if (con != null) {
            con.next = prev;
        } else {
            head = prev;
        }

        tail.next = cur;
        return head;
    }
}
