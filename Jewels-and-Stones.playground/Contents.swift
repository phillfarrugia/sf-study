//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var jewels: [Character: Int] = [:]
        var numberOfJewels: Int = 0

        for (index, char) in J.enumerated() {
            jewels[char] = 1
        }

        for (index, char) in S.enumerated() {
            if jewels[char] != nil {
                numberOfJewels += 1
            }
        }

        return numberOfJewels
    }
}


