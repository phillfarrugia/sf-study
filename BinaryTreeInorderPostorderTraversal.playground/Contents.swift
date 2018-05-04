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

// inorder = [9,3,15,20,7]
// postorder = [9,15,7,20,3]

// [15,20,7]
// [15,7,20]

// [15]
// [15]

class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        let inStart = 0
        let inEnd = inorder.count - 1
        let postStart = 0
        let postEnd = postorder.count - 1
        return buildTree(inorder: inorder,
                         postorder: postorder,
                         inStart: inStart,
                         inEnd: inEnd,
                         postStart: postStart,
                         postEnd: postEnd)
    }

    func buildTree(inorder: [Int], postorder: [Int],
                   inStart: Int, inEnd: Int,
                   postStart: Int, postEnd: Int) -> TreeNode? {
        if inStart > inEnd || postStart > postEnd {
            return nil
        }

        let rootValue = postorder[postEnd]
        let node = TreeNode(rootValue)

        var k = 0
        for index in 0..<inorder.count {
            if (inorder[index] == rootValue) {
                k = index
                break
            }
        }

        node.left = buildTree(inorder: inorder,
                              postorder: postorder,
                              inStart: inStart,
                              inEnd: k - 1,
                              postStart: postStart,
                              postEnd: postStart + k - (inStart + 1))

        node.right = buildTree(inorder: inorder,
                               postorder: postorder,
                               inStart: k + 1,
                               inEnd: inEnd,
                               postStart: postStart + k - inStart,
                               postEnd: postEnd - 1)
        return node
    }
}

//Solution().buildTree([9,3,15,20,7], [9,15,7,20,3])
Solution().buildTree([15, 2], [15, 2])
