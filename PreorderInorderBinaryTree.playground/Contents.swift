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

// preorder = [3,9,20,15,7]
// inorder = [9,3,15,20,7]

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let preStart = 0
        let preEnd = preorder.count - 1
        let inStart = 0
        let inEnd = inorder.count - 1
        return buildTree(preorder: preorder,
                         inorder: inorder,
                         preStart: preStart,
                         preEnd: preEnd,
                         inStart: inStart,
                         inEnd: inEnd)
    }

    func buildTree(preorder: [Int],
                   inorder: [Int],
                   preStart: Int,
                   preEnd: Int,
                   inStart: Int,
                   inEnd: Int) -> TreeNode? {
        if preStart > preEnd || inStart > inEnd {
            return nil
        }

        let root = preorder[preStart]
        var indexOfRootInInorder = 0

        for index in 0..<inorder.count {
            if inorder[index] == root {
                indexOfRootInInorder = index
            }
        }

        let node = TreeNode(root)

        node.left = buildTree(preorder: preorder,
                              inorder: inorder,
                              preStart: preStart + 1,
                              preEnd: preStart + (indexOfRootInInorder - inStart),
                              inStart: inStart,
                              inEnd: indexOfRootInInorder - 1)

        node.right = buildTree(preorder: preorder,
                               inorder: inorder,
                               preStart: preStart + 1,
                               preEnd: preStart + (indexOfRootInInorder - inStart),
                               inStart: indexOfRootInInorder + 1,
                               inEnd: inEnd)

        return node
    }

}

// preorder, inorder
Solution().buildTree([3,9,20,15,7], [9,3,15,20,7])
