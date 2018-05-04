//: Playground - noun: a place where people can play

import UIKit

/*
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 */

class Solution {

    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var numIndex = 0

        for (index, num) in nums.enumerated() {
            if num == target {
                return index
            }

            if num > target {
                return index
            }

            numIndex = index
        }

        return numIndex + 1
    }

}

Solution().searchInsert([1,3,5,6], 5)
Solution().searchInsert([1,3,5,6], 2)
Solution().searchInsert([1,3,5,6], 7)
Solution().searchInsert([1,3,5,6], 0)
