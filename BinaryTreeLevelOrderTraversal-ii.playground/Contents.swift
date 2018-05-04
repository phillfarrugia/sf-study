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

/**
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 */

class Solution {

    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var stack: [[TreeNode]] = [[root]]
        var output: [[Int]] = [[root.val]]
        return levelOrderBottom(stack: &stack, output: &output)
    }

    func levelOrderBottom(stack: inout [[TreeNode]], output: inout [[Int]]) -> [[Int]] {
        var currentLevel: [Int] = []
        var currentLevelNodes: [TreeNode] = []
        while !stack.isEmpty {
            let lastLevelNodes = stack.popLast()!
            for node in lastLevelNodes {
                if let left = node.left {
                    currentLevel.append(left.val)
                    currentLevelNodes.append(left)
                }
                if let right = node.right {
                    currentLevel.append(right.val)
                    currentLevelNodes.append(right)
                }
            }
            if !currentLevel.isEmpty && !currentLevelNodes.isEmpty {
                output.insert(currentLevel, at: 0)
                stack.append(currentLevelNodes)
                currentLevel = []
                currentLevelNodes = []
            }
        }
        return output
    }

}
