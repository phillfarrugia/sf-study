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
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var isValid = true

        if let left = root.left {
            isValid = left.val < root.val
        }

        if let right = root.right {
            isValid = right.val > root.val
        }

        if !isValid {
            return false
        }

        return isValidBST(root.left, max: root.val) && isValidBST(root.right, min: root.val)
    }

    func isValidBST(_ root: TreeNode?, max: Int) -> Bool {
        guard let root = root else { return true }
        var isValid = root.val < max

        if let left = root.left {
            isValid = left.val < root.val
        }

        if let right = root.right {
            isValid = right.val > root.val
        }

        if !isValid {
            return false
        }

        return isValidBST(root.left, max: max)
            && isValidBST(root.left, max: root.val)
            && isValidBST(root.right, max: max)
            && isValidBST(root.right, min: root.val)
    }

    func isValidBST(_ root: TreeNode?, min: Int) -> Bool {
        guard let root = root else { return true }
        var isValid = root.val > min

        if let left = root.left {
            isValid = left.val < root.val
        }

        if let right = root.right {
            isValid = right.val > root.val
        }

        if !isValid {
            return false
        }

        return isValidBST(root.left, min: min)
            && isValidBST(root.left, max: root.val)
            && isValidBST(root.right, min: min)
            && isValidBST(root.right, min: root.val)
    }
}
