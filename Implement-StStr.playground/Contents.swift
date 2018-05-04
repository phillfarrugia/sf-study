//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else { return 0 }
        guard needle.count <= haystack.count else { return -1 }
        guard haystack != needle else { return 0 }
        if haystack.count == needle.count {
            if haystack == needle {
                return 0
            } else {
                return -1
            }
        }

        var i = 0
        var j = 0
        var resultIndex = -1
        while i < haystack.count {
            if j >= needle.count {
                return resultIndex
            }

            if Array(haystack)[i] == Array(needle)[j] {
                if j == 0 {
                    resultIndex = i
                }
                i += 1
                j += 1
            } else {
                if resultIndex == -1 {
                    i += 1
                } else {
                    i = resultIndex + 1
                    resultIndex = -1
                }
                j = 0
            }
        }

        if j >= needle.count {
            return resultIndex
        }

        return -1
    }
}

func check<T: Equatable>(_ l: T, _ r: T) -> Bool {
    if l == r {
        print("Correct. Output: \(l)")
        return true
    } else {
        print("Incorrect. Expected: \(r) \t Actual: \(l)")
        return false
    }
}

check(Solution().strStr("hello", ""), 0)
check(Solution().strStr("hello", "ll"), 2)
check(Solution().strStr("aaaa", "bba"), -1)
check(Solution().strStr("aaa", "aaaa"), -1)
check(Solution().strStr("a", "a"), 0)
check(Solution().strStr("mississippi", "issi"), 1)
check(Solution().strStr("mississippi", "issip"), 4)
check(Solution().strStr("mississippi", "pi"), 9)
check(Solution().strStr("aabaaabaaac", "aabaaac"), 4)
