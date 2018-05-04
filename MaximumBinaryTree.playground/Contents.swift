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

    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        let mIndex = maxIndex(in: nums, start: 0, end: nums.count-1)
        let root = TreeNode(nums[mIndex])

        root.left = constructMaximumBinaryTree(nums,
                                               start: 0,
                                               end: mIndex-1)

        root.right = constructMaximumBinaryTree(nums,
                                                start: mIndex+1,
                                                end: nums.count-1)

        return root
    }

    func constructMaximumBinaryTree(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        let mIndex = maxIndex(in: nums, start: start, end: end)
        let root = TreeNode(nums[mIndex])
        
        root.left = constructMaximumBinaryTree(nums,
                                               start: start,
                                               end: mIndex-1)

        root.right = constructMaximumBinaryTree(nums,
                                                start: mIndex+1,
                                                end: end)
        
        return root
    }

    func maxIndex(in array: [Int], start: Int, end: Int) -> Int {
        var maxIndex = start
        for index in start...end {
            if array[index] > array[maxIndex] {
                maxIndex = index
            }
        }
        return maxIndex
    }

}

Solution().constructMaximumBinaryTree([3,2,1,6,0,5])
