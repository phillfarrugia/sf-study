//: Playground - noun: a place where people can play

import UIKit

/**
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 */

/// [-2,1,-3,4,-1,2,1,-5,4]

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return nums[0] }
        
        var maxSum = nums[0]
        var startIndex = 0
        var endIndex = nums.count - 1

        return maxSum
    }

    func sum(startIndex: Int, endIndex: Int, nums: [Int]) -> Int {
        var output = 0
        for i in startIndex...endIndex {
            output += nums[i]
        }
        return output
    }

}

//Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
//Solution().maxSubArray([-2147483647])
//[-2147483647]

// Input: [-2,1,-3,4,-1,2,1,-5,4]
// Output: 6
// Explanation: [4,-1,2,1] has the largest sum = 6.

//class Solution {
//    func maxSubArray(_ nums: [Int]) -> Int {
//
//        var maxSum = nums[0]
//        var i = 0
//        var j = nums.count - 1
//
//        while i < nums.count {
//
//            maxSum = max(maxSum, sum(startIndex: i, endIndex: j, nums: nums))
//
//            if j == i {
//                j = nums.count - 1
//                i += 1
//            } else {
//                j -= 1
//            }
//        }
//
//        return maxSum
//    }
//
//    func sum(startIndex: Int, endIndex: Int, nums: [Int]) -> Int {
//        var output = 0
//        for i in startIndex...endIndex {
//            output += nums[i]
//        }
//        return output
//    }
//
//}
