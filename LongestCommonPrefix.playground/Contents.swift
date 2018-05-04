//: Playground - noun: a place where people can play

import UIKit

/*
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".
 */

class Solution {

    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        guard strs.count > 1 else { return strs[0] }

        var prefix: String = strs[0]
        for i in 1..<strs.count {
            while !strs[i].hasPrefix(prefix) {
                prefix.removeLast()
            }
        }

        return prefix
    }

}

Solution().longestCommonPrefix(["flower","flow", "flight"]) // "fl"
Solution().longestCommonPrefix(["a"]) // "a"
Solution().longestCommonPrefix(["aaa", "aa", "aaa"]) // "aa"
Solution().longestCommonPrefix(["dog","racecar","car"]) // ""
