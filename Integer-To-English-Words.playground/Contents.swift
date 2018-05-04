//: Playground - noun: a place where people can play

import UIKit

class Solution {

    var numberMap: [Int: String] = [
        0: "Zero",
        1: "One",
        2: "Two",
        3: "Three",
        4: "Four",
        5: "Five",
        6: "Six",
        7: "Seven",
        8: "Eight",
        9: "Nine",
        10: "Ten",
        11: "Eleven",
        12: "Twelve",
        13: "Thirteen",
        14: "Fourteen",
        15: "Fifteen",
        16: "Sixteen",
        17: "Seventeen",
        18: "Eighteen",
        19: "Nineteen",
        20: "Twenty",
        30: "Thirty",
        40: "Forty",
        50: "Fifty",
        60: "Sixty",
        70: "Seventy",
        80: "Eighty",
        90: "Ninety"
    ]

    func numberToWords(_ num: Int) -> String {
        var output: String = ""
        if num < 20 {
            output = numberMap[num]!
        } else if num < 100 {
            var nums = digits(num)
            var tenth = nums[0] * 10 // i.e 4 * 10 = 40
            var single = nums[1]
            output = output.appending("\(numberMap[tenth]!)")
            if single > 0 {
                output = output.appending(" \(numberMap[single]!)")
            }
        } else if num <= 999 {
            var nums = digits(num)
            var hundredth = nums[0]
            var tenth = nums[1] * 10
            var single = nums[2]
            output = output.appending("\(numberMap[hundredth]!) Hundred")
            if tenth > 0 {
                if tenth < 20 {
                    output = output.appending(" \(numberMap[tenth + single]!)")
                } else {
                    output = output.appending(" \(numberMap[tenth]!)")

                    if single > 0 {
                        output = output.appending(" \(numberMap[single]!)")
                    }
                }
            } else if single > 0 {
                if single > 0 {
                    output = output.appending(" \(numberMap[single]!)")
                }
            }
        } else if num <= 999999 {
            var nums = digits(num)
            var thousands = num/1000
            var hundreds = num%1000
            var thousandsText = numberToWords(num/1000) // one hundred
            var hundredsText = numberToWords(num%1000)
            output = output.appending("\(thousandsText) Thousand")
            if hundreds > 0 {
                output = output.appending(" \(hundredsText)")
            }
        } else if num <= 999999999 {
            var millions = num/1000000
            var millionsText = numberToWords(millions)
            output = output.appending("\(millionsText) Million")
            var thousands = num%1000000
            if thousands > 0 {
                var thousandstext = numberToWords(thousands)
                output = output.appending(" \(thousandstext)")
            }
        } else if num <= 9999999999 {
            var billions = num/1000000000
            var billionsText = numberToWords(billions)
            output = output.appending("\(billionsText) Billion")
            var millions = num%1000000000
            if millions > 0 {
                var millionsText = numberToWords(millions)
                output = output.appending(" \(millionsText)")
            }
        }
        return output
    }

    func digits(_ num: Int) -> [Int] {
        var temp = num
        var nums: [Int] = []
        while temp > 0 {
            let last = temp % 10
            nums.insert(last, at: 0)
            temp = (temp - last) / 10
        }
        return nums
    }

}

//Solution().numberToWords(1234567)
//Solution().numberToWords(999999)
//Solution().numberToWords(1234567891)
//Solution().numberToWords(111)
Solution().numberToWords(1000)

