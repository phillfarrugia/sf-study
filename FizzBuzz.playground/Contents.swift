//: Playground - noun: a place where people can play

import UIKit

// Write a program that outputs the string representation of numbers from 1 to n.
//
// But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”.
// For numbers which are multiples of both three and five output “FizzBuzz”.

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var output: [String] = []
        for index in 1...n {
            let isMultipleOfThree = index % 3 == 0
            let isMultipleOfFive = index % 5 == 0
            if isMultipleOfThree && isMultipleOfFive {
                output.append("FizzBuzz")
            } else if isMultipleOfThree {
                output.append("Fizz")
            } else if isMultipleOfFive {
                output.append("Buzz")
            } else {
                output.append(String(index))
            }
        }
        return output
    }
}

Solution().fizzBuzz(15)
