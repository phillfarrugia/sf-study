//: Playground - noun: a place where people can play

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/**
 Given a sorted linked list, delete all duplicates such that each element appear only once.

 Example 1.
 Input: 1->1->2
 Output: 1->2

 Example 2.
 Input: 1->1->2->3->3
 Output: 1->2->3

 Example 3.
 Input: 1->1->1
 Output: 1

 */

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var previousNode = head
        var currentNode = head?.next

        while let current = currentNode {
            if let previous = previousNode {
                if previous.val == current.val {
                    previousNode?.next = current.next
                    currentNode = current.next
                    continue
                } else {
                    previousNode = current
                    currentNode = current.next
                    continue
                }
            }
        }

        return head
    }
}
