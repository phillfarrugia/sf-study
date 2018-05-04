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

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else { return nil }
        var previousNodes: [ListNode] = []
        var currentNode: ListNode? = head
        var nodeCount: Int = 0

        while currentNode != nil {
            guard let node = currentNode else { return nil }
            previousNodes.append(node)
            if previousNodes.count > n + 1 {
                previousNodes.removeFirst()
            }
            currentNode = node.next
            nodeCount += 1
        }

        if nodeCount <= n {
            if n == nodeCount {
                if previousNodes.count > 1 {
                    return previousNodes[1]
                } else {
                    return nil
                }
            } else {
                return nil
            }
        } else {
            previousNodes[0].next = previousNodes[1].next
        }

        return head
    }
}

let node1 = ListNode(1)
print(Solution().removeNthFromEnd(node1, 1)?.val)
