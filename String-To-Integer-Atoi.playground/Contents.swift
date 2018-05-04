//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func myAtoi(_ str: String) -> Int {
        let characters = Array(str)

        // String length is > 0
        guard characters.count > 0 else {
            return 0
        }

        var nums: [Int] = []
        var numerals: [String.Element: Int] = [
            "0": 0,
            "1": 1,
            "2": 2,
            "3": 3,
            "4": 4,
            "5": 5,
            "6": 6,
            "7": 7,
            "8": 8,
            "9": 9
        ]
        var containsMinus: Bool = false
        var containsPlus: Bool = false

        for character in characters {

            if (containsPlus || containsMinus) && character == " " {
                return 0
            }

            if character == "-" {
                if containsMinus {
                    return 0
                }
                containsMinus = true
            }

            if character == "+" {
                if containsPlus {
                    return 0
                }
                containsPlus = true
            }

            if let numeral = numerals[character] {
                nums.append(numeral)
            } else if nums.isEmpty && character != " " && character != "+" && character != "-" {
                return 0
            } else if !nums.isEmpty {
                break
            }
        }

        var output: Int = 0
        for (_, num) in nums.enumerated() {
            if !containsMinus {
                output = output * 10 + num
            } else {
                output = output * 10 - num
            }

            if output >= Int32.max {
                return Int(Int32.max)
            } else if output <= Int32.min {
                return Int(Int32.min)
            }
        }

        if containsMinus && containsPlus {
            return 0
        }

        return output
    }

}

Solution().myAtoi("42") // 42
Solution().myAtoi("-42") // -42
Solution().myAtoi("4193 with words") // 4193
Solution().myAtoi("words and 987") // 0
Solution().myAtoi("-91283472332") // -2147483648 (max Int32)
Solution().myAtoi("3.14159") // 3
Solution().myAtoi("+1") // 1
Solution().myAtoi("+-2") // 0
Solution().myAtoi("-+1") // 0
Solution().myAtoi("    -00134") // -134
Solution().myAtoi("  +0 123") // 0
Solution().myAtoi("  -0 451") // 0
Solution().myAtoi("  - 321") // 0
Solution().myAtoi("+1") // 1
Solution().myAtoi(" ++1") // 0
Solution().myAtoi("   -42") // -42

