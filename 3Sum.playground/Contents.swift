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

// Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0?
// Find all unique triplets in the array which gives the sum of zero.
//
// Note:
//
// The solution set must not contain duplicate triplets.

// Given array nums = [-1, 0, 1, 2, -1, -4],
//
// A solution set is:
// [
// [-1, 0, 1],
// [-1, -1, 2]
// ]
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var sets: [[Int]] = []

        for i in 0..<nums.count - 2 {
            for j in i+1..<nums.count - 1 {
                for k in j+1..<nums.count {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        if !contains(nums:[nums[i], nums[j], nums[k]], in: sets) {
                            sets.append([nums[i], nums[j], nums[k]])
                        }
                    }
                }
            }
        }

        return sets
    }

    func contains(nums: [Int], in sets: [[Int]]) -> Bool {
        for set in sets {
            if nums[0] == nums[1] && nums[1] == nums[2] {
                if set[0] == nums[0] && set[1] == nums[1] && set[2] == nums[2] {
                    return true
                }
            } else if set.contains(nums[0])
                && set.contains(nums[1])
                && set.contains(nums[2]) {
                return true
            }
        }
        return false
    }

}

Solution().threeSum([-1,0,1,2,-1,-4])
//Solution().threeSum([0])
//Solution().threeSum([-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0])
//Solution().threeSum([-2,-2,0,-5,-1,-3,0,4,3,4,1,3,0,-1,0,3])

// let output = Solution().buildTree([-1,0,1,2,-1,-4])
