//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func reverseString(_ s: String) -> String {
        var reversed: String = ""
        for index in s.count..0 {
            reversed = reversed.appending(character(in: s, atIndex: index))
        }
        return reversed
    }
}

func character(in string: String, atIndex index: Int) -> String {
    let indexOf = string.index(string.startIndex, offsetBy: index)
    return String(string[indexOf])
}

Solution().reverseString("hello") // olleh
