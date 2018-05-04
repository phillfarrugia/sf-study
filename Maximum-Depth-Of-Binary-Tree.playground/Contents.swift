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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}

//class Solution {
//    func maxDepth(_ root: TreeNode?) -> Int {
//        guard let root = root else { return 0 }
//
//        if root.left == nil && root.right == nil {
//            return 1
//        }
//
//        if let left = root.left {
//            let leftTotal = 1 + maxDepth(left)
//
//            if let right = root.right {
//                let rightTotal = 1 + maxDepth(right)
//                return max(leftTotal, rightTotal)
//            }
//
//            return leftTotal
//        } else if let right = root.right {
//            let rightTotal = 1 + maxDepth(right)
//            return rightTotal
//        }
//
//        return 0
//    }
//}

