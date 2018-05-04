//: Playground - noun: a place where people can play

import UIKit

class Solution {

    func countAndSay(_ n: Int) -> String {
        guard n > 0 else { return "0" }
        var output: String = ""

        if n == 1 {
            output = "1"
        } else {
            let previousNums = countAndSay(n-1)
            var i = 0
            var previous: String? = nil
            var numCounter = 0

            while i <= previousNums.count-1 {
                let num = Array(previousNums)[i]
                if let previousNum = previous {
                    if previousNum == String(num) {
                        numCounter += 1
                        previous = String(num)
                    } else {
                        output += "\(numCounter)\(previousNum)"
                        numCounter = 1
                        previous = String(num)
                    }
                } else {
                    numCounter += 1
                    previous = String(num)
                }

                if i == previousNums.count - 1 {
                    output += "\(numCounter)\(num)"
                }

                i += 1
            }
        }

        return output
    }

}

func check<T: Equatable>(_ a: T, _ b: T) {
    if a == b {
        print("correct:\t\(a)")
    } else  {
        print("incorrect:\t\(a) should be \(b)")
    }
}

check(Solution().countAndSay(1), "1")
check(Solution().countAndSay(2), "11")
check(Solution().countAndSay(3), "21")
check(Solution().countAndSay(4), "1211")
