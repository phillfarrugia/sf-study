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

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }

        var sumArray: [Int] = []
        var carryOver: Int = 0

        var currentLeftNode: ListNode? = l1
        var currentRightnode: ListNode? = l2

        while currentLeftNode != nil {
            var sumValue = currentRightnode == nil ? currentLeftNode!.val + carryOver :
                currentLeftNode!.val + currentRightnode!.val + carryOver
            carryOver = 0

            if sumValue >= 10 {
                carryOver += 1
                sumValue = sumValue - 10
            }

            sumArray.append(sumValue)
            currentLeftNode = currentLeftNode?.next
            currentRightnode = currentRightnode?.next
        }

        while currentRightnode != nil {
            var sumValue = currentLeftNode == nil ? currentRightnode!.val + carryOver :
                currentLeftNode!.val + currentRightnode!.val + carryOver
            carryOver = 0

            if sumValue >= 10 {
                carryOver += 1
                sumValue = sumValue - 10
            }

            sumArray.append(sumValue)
            currentLeftNode = currentLeftNode?.next
            currentRightnode = currentRightnode?.next
        }

        if carryOver > 0 {
            sumArray.append(carryOver)
        }

        return list(with: sumArray)
    }

    func list(with array: [Int]) -> ListNode {
        var index = array.count - 1
        var previousNode: ListNode? = nil

        while index >= 0 {
            var node = ListNode(array[index])
            node.next = previousNode
            previousNode = node

            index -= 1
        }

        return previousNode!
    }

}

func list(with array: [Int]) -> ListNode {
    var index = array.count - 1
    var previousNode: ListNode? = nil

    while index >= 0 {
        var node = ListNode(array[index])
        node.next = previousNode
        previousNode = node

        index -= 1
    }

    return previousNode!
}

let l1 = list(with: [0,8,6,5,6,8,3,5,7])
let l2 = list(with: [6,7,8,0,8,5,8,9,7])

//node1.next = node2
//node2.next = node3
//
//node5.next = node6
//node6.next = node4

print(Solution().addTwoNumbers(l1, l2)?.val)


