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

// MARK: - Iterative

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var levels: [[Int]] = []
        var queue: [[TreeNode]] = [[root]]

        while queue.count > 0 {
            let currentLevel = queue.popLast()!
            var currentLevelValues: [Int] = []
            var nextLevel: [TreeNode] = []
            for node in currentLevel {
                if let left = node.left {
                    nextLevel.append(left)
                }
                if let right = node.right {
                    nextLevel.append(right)
                }

                currentLevelValues.append(node.val)
            }
            levels.append(currentLevelValues)
            if !nextLevel.isEmpty {
                queue.append(nextLevel)
            }
        }

        return levels
    }
}

// MARK: - Recursive

//class Solution {
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        guard let root = root else { return [] }
//        var stack: [TreeNode] = [root]
//        var levels: [[Int]] = []
//        return level(root, stack: &stack, levels: &levels)
//    }
//
//    func level(_ root: TreeNode?, stack: inout [TreeNode], levels: inout [[Int]]) -> [[Int]] {
//        if !stack.isEmpty {
//            var levelValues: [Int] = []
//            var stackCopy = stack
//            stack = []
//            for node in stackCopy {
//                levelValues.append(node.val)
//                if let left = node.left {
//                    stack.append(left)
//                }
//                if let right = node.right {
//                    stack.append(right)
//                }
//            }
//            levels.append(levelValues)
//            level(root, stack: &stack, levels: &levels)
//        }
//        return levels
//    }
//}

