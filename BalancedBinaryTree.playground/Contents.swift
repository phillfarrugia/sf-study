//: Playground - noun: a place where people can play

import UIKit

/**
 Given a binary tree, determine if it is height-balanced.

 For this problem, a height-balanced binary tree is defined as:

 a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 */

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

    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        if root.left == nil && root.right == nil { return true }
        let left = maxHeight(root.left)
        let right = maxHeight(root.right)
        let doNotDiffer = (left == right) || (left - 1) == right || (left + 1) == right
        return doNotDiffer && isBalanced(root.left) && isBalanced(root.right)
    }

    func maxHeight(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxHeight(root.left), maxHeight(root.right)) + 1
    }

}

// [3,9,20,null,null,15,7] // true
// [1,2,2,3,3,null,null,4,4] // false
