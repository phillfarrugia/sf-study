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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return isSymmetric(root.left, otherChild: root.right)
    }

    func isSymmetric(_ root: TreeNode?, otherChild: TreeNode?) -> Bool {
        if let root = root, let otherChild = otherChild, root.val == otherChild.val {
            return isSymmetric(root.left, otherChild: otherChild.right) &&
                isSymmetric(root.right, otherChild: otherChild.left)
        }
        return root == nil && otherChild == nil
    }
}

let ints: [String] = [1,2,3].map(String.init)

let strings: [String] = [1,2,3].map { num in
    return String(num)
}
