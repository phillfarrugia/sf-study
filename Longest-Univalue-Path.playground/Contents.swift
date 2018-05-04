//: Playground - noun: a place where people can play

import Foundation

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

    var ans = 0

    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

//        if let left = root.left, let right = root.right {
//
//            var leftMatches = left.val == root.val ? 1 : 0
//            leftMatches += longestUnivaluePath(left)
//
//            var rightMatches = right.val == root.val ? 1 : 0
//            rightMatches += longestUnivaluePath(right)
//
//            if left.val == root.val && right.val == root.val {
//                return leftMatches + rightMatches
//            }
//
//            return max(leftMatches, rightMatches)
//        }

        var leftMatches = 0
        if let left = root.left, left.val == root.val {
            leftMatches = longestUnivaluePath(left) + 1
        }

        var rightMatches = 0
        if let right = root.right, right.val == root.val {
            rightMatches = longestUnivaluePath(right) + 1
        }

        ans = max(ans, leftMatches + rightMatches)
        return max(leftMatches, rightMatches)
    }

}

