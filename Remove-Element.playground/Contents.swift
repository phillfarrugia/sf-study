//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var index = 0

        while index < nums.count {
            if nums[index] == val {
                nums.remove(at: index)
            } else {
                index +=  1
            }
        }

        return nums.count
    }
}

var nums = [3,2,2,3]
Solution().removeElement(&nums, 3)
//Solution().removeElement(&[2,2,3], 3)
