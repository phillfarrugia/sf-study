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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if let p = p, let q = q {
            return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
        } else {
            return p == nil && q == nil
        }
    }
}
