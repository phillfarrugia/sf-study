//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var currentIndex = 0

        while currentIndex < nums.count {
            let currentValue = nums[currentIndex]
            if nums.count > {
                let previousValue = nums[currentIndex - 1]
                if previousValue == currentValue {
                    nums.remove(at: currentIndex)
                } else {
                    currentIndex -= 1
                }
            } else {
                currentIndex -= 1
            }
        }

        return nums.count
    }
}

var input: [Int] = [1,1,2]
Solution().removeDuplicates(&input)
