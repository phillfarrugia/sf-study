//: Playground - noun: a place where people can play

import UIKit

// Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
// For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
//
// Note:
// You must do this in-place without making a copy of the array.
// Minimize the total number of operations.

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var totalRemaining = nums.count

        while i < totalRemaining {
            if nums[i] == 0 {
                nums.remove(at: i)
                nums.append(0)
                totalRemaining -= 1
            } else {
                i += 1
            }
        }
    }
}

var nums = [0,1,0,3,12]
// first iteration, checks 0, moves it, totalremaining = 4, i = 0
// second iteration, checks the 1, does nothing. total remaining = 4, i = 1
// third iteration, checks the 0, moves it, total remaining = 3, i = 1
// fourth iteration, checks the 3, does nothing, total remaining = 3, i = 2
// fifth iteration, checks the 12, does nothing, total remaining = 3, i = 3
Solution().moveZeroes(&nums)
print(nums)
