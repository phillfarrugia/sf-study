//: Playground - noun: a place where people can play

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        guard let t1 = t1 else { return t2 }
        var stack: [[TreeNode?]] = []
        stack.append([t1, t2])

        while !stack.isEmpty {
            let current = stack.popLast()!
            if (current[0] == nil || current[1] == nil) {
                continue
            }

            current[0]!.val += current[1]!.val
            if (current[0]!.left == nil) {
                current[0]!.left = current[1]?.left
            } else {
                stack.append([current[0]!.left, current[1]!.left])
            }

            if (current[0]!.right == nil) {
                current[0]!.right = current[1]?.right
            } else {
                stack.append([current[0]!.right, current[1]!.right])
            }
        }

        return t1
    }
}

//class Solution {
//    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
//        guard let t1 = t1 else { return t2 }
//        guard let t2 = t2 else { return t1 }
//
//        // Merge Root Node
//        var mergedNode: TreeNode = TreeNode(t1.val + t2.val)
//
//        // Merge Left Node
//        if let t1Left = t1.left, let t2Left = t2.left {
//            mergedNode.left = mergeTrees(t1Left, t2Left)
//        } else if let t1Left = t1.left {
//            mergedNode.left = t1Left
//        } else if let t2Left = t2.left {
//            mergedNode.left = t2Left
//        }
//
//        // Merge Right Node
//        if let t1Right = t1.right, let t2Right = t2.right {
//            mergedNode.right = mergeTrees(t1Right, t2Right)
//        } else if let t1Right = t1.right {
//            mergedNode.right = t1Right
//        } else if let t2Right = t2.right {
//            mergedNode.right = t2Right
//        }
//
//        return mergedNode
//    }
//}


