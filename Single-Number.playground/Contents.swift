//: Playground - noun: a place where people can play

import UIKit

// Given an array of integers, every element appears twice except for one. Find that single one.
//
// Note:
// Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var existingNums: [Int: Int] = [:]
        for num in nums {
            if let existingNum = existingNums[num] {
                existingNums[num] = existingNum + 1
            } else {
                existingNums[num] = 1
            }
        }

        for key in existingNums.keys {
            if existingNums[key] == 1 {
                return key
            }
        }

        return 0
    }
}

Solution().singleNumber([1,1,2,2,3,3,4,4,5]) // 5
Solution().singleNumber([1,3,1,-1,3]) // -1
