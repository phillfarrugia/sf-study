//: Playground - noun: a place where people can play

import UIKit

// The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
//
// Given two integers x and y, calculate the Hamming distance.
//
// Note:
// 0 ≤ x, y < 231.

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        guard (x >= 0), (y >= 0) else {
            return 0
        }

        var count = 0
        var diffBits = x^y

        while diffBits > 0 {
            let mask = diffBits & 1
            if mask != 0 {
                count += 1
            }
            diffBits = diffBits>>1
        }

        return count
    }
}

Solution().hammingDistance(1, 4)
