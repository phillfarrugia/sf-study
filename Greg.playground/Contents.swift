//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var index = 0
        var length = nums.count

        while index < nums.count {
            if nums[index] == val {
                length -= 1
            }
            index +=  1
        }

        return length
    }
}

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
