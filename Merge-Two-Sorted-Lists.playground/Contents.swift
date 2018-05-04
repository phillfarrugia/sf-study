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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }

        var currentLeftNode: ListNode? = l1
        var currentRightNode: ListNode? = l2

        var headNode: ListNode? = nil
        var previousNode: ListNode? = nil

        while currentLeftNode != nil {
            let leftNode = currentLeftNode!

            if let rightNode = currentRightNode, rightNode.val < leftNode.val {
                currentRightNode = rightNode.next

                if headNode == nil {
                    headNode = rightNode
                    previousNode = rightNode
                } else {
                    previousNode?.next = rightNode
                    previousNode = rightNode
                }
            } else {
                currentLeftNode = leftNode.next

                if headNode == nil {
                    headNode = leftNode
                    previousNode = leftNode
                } else {
                    previousNode?.next = leftNode
                    previousNode = leftNode
                }
            }
        }

        while currentRightNode != nil {
            let rightNode = currentRightNode!
            currentRightNode = rightNode.next

            if headNode == nil {
                headNode = rightNode
                previousNode = rightNode
            } else {
                previousNode?.next = rightNode
                previousNode = rightNode
            }
        }

        return headNode
    }

//    func list(with array: [Int]) -> ListNode? {
//        guard array.count > 0 else {
//            return nil
//        }
//
//        var previousNode: ListNode?
//        var iterator = array.count-1
//        while iterator >= 0 {
//            var node = ListNode(array[iterator])
//            node.next = previousNode
//            previousNode = node
//            iterator -= 1
//        }
//
//        return previousNode
//    }

}

let one = ListNode(1)
let two = ListNode(2)
let four = ListNode(4)
one.next = two
two.next = four

let oneOne = ListNode(1)
let three = ListNode(3)
let fourTwo = ListNode(4)
oneOne.next = three
three.next = fourTwo

//Solution().mergeTwoLists(one, oneOne) // expects 1->1->2->3->4->4
//print(Solution().mergeTwoLists(one, oneOne)?.val)
