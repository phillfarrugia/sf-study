
//: Playground - noun: a place where people can play

import UIKit

class Solution {

    var romanNumerals: [String: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    func romanToInt(_ s: String) -> Int {
        var numerals = Array(s)
        guard numerals.count > 0 else { return 0 }
        var output = 0

        var i = 0
        while i < numerals.count {
            var numeral = numerals[i]
            guard var int = romanNumerals[String(numeral)] else { return -1 }

            if numerals.count > i + 1 {
                var nextNumeral = numerals[i+1]
                guard let nextInt = romanNumerals[String(nextNumeral)] else { return -1 }

                if numeral == "I" && (nextNumeral == "V" || nextNumeral == "X") {
                    output += (nextInt - int)
                    i += 2
                    continue
                } else if numeral == "X" && (nextNumeral == "L" || nextNumeral == "C") {
                    output += (nextInt - int)
                    i += 2
                    continue
                } else if numeral == "C" && (nextNumeral == "D" || nextNumeral == "M") {
                    output += (nextInt - int)
                    i += 2
                    continue
                }

            }

            output += int
            i += 1
        }

        return output
    }
}

Solution().romanToInt("III") // 3
Solution().romanToInt("IV") // 4
Solution().romanToInt("IX") // 9
Solution().romanToInt("LVIII") // 58
Solution().romanToInt("MCMXCIV") // 1994
