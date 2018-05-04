//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if (x < 0) || (x % 10 == 0 && x != 0) {
            return false
        }

        var reversed: Int = 0
        var temp: Int = x

        while temp > 0 {
            reversed = reversed * 10 + (temp % 10)
            temp = temp / 10
        }

        return reversed == x
    }
}

Solution().isPalindrome(12321) // true
