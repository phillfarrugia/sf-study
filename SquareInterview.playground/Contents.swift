//: Playground - noun: a place where people can play

import UIKit

/*

 Version ex 1.2.3

 - constructor Version(1, 2, 3)
 - string representation function "1.2.3"
 - implement equality Version(1, 2, 3) == Version(1, 2, 3)
 - implement ordering  Version(1, 2, 3) < Version(1, 2, 4)

 Gem::Version

 1 == 1.0.0.0
 1.2.3 > 1.0

 version.bump()
 - return a new Version that's incremented

 1.2.3.bump() == 1.4
 1.bump() == 2
 1.2.9.bump() == 1.3
 1.2.100.bump() == 1.3


 */

struct Version: CustomStringConvertible {

    private var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }

    var description: String {
        return nums.map { String($0) }.joined(separator: ".")
    }

    func bump() -> Version {
        var numsCopy = nums
        numsCopy.removeLast()
        var last = numsCopy[numsCopy.count-1]
        last += 1
        numsCopy[numsCopy.count-1] = last
        return Version(numsCopy)
    }

}

// MARK: - Equatable

extension Version: Equatable {

    static func == (lhs: Version, rhs: Version) -> Bool {
        var longest = rhs.nums.count > lhs.nums.count ?
            rhs.nums : lhs.nums

        for index in 0..<longest.count {
            var left = 0
            if lhs.nums.count > index {
                left = lhs.nums[index]
            }
            var right = 0
            if rhs.nums.count > index {
                right = rhs.nums[index]
            }
            if left != right {
                return false
            }
        }

        return true
    }

}

// MARK: - Ordering

extension Version: Comparable {

    static func < (lhs: Version, rhs: Version) -> Bool {
        var longest = rhs.nums.count > lhs.nums.count ?
            rhs.nums : lhs.nums

        for index in 0..<longest.count {
            var left = 0
            if lhs.nums.count > index {
                left = lhs.nums[index]
            }
            var right = 0
            if rhs.nums.count > index {
                right = rhs.nums[index]
            }
            if left > right {
                return false
            } else if right > left {
                return true
            }
        }

        return false
    }

}

// MARK: - Addition

extension Version {

    static func + (lhs: Version, rhs: Version) -> Version {
        var longest = rhs.nums.count > lhs.nums.count ?
            rhs.nums : lhs.nums

        for index in 0..<longest.count {
            var left = 0
            if lhs.nums.count > index {
                left = lhs.nums[index]
            }

            var right = 0
            if rhs.nums.count > index {
                right = rhs.nums[index]
            }

            longest[index] = left + right
        }

        return Version(longest)
    }

}

// MARK: - Subtraction

extension Version {

    static func - (lhs: Version, rhs: Version) -> Version {
        var longest = rhs.nums.count > lhs.nums.count ?
            rhs.nums : lhs.nums

        for index in 0..<longest.count {
            var left = 0
            if lhs.nums.count > index {
                left = lhs.nums[index]
            }

            var right = 0
            if rhs.nums.count > index {
                right = rhs.nums[index]
            }

            let result = left - right
            if result >= 0 {
                longest[index] = left - right
            } else {
                longest[index] = 0
            }
        }

        return Version(longest)
    }

}

print("\(Version([1,2,3]))") // 1.2.3
print("\(Version([1,2,3]) == Version([1,2,3]))") // true
print("\(Version([1,2,3]) == Version([1,2,4]))") // false
print("\(Version([1,2,3]) == Version([1]))") // false
print("\(Version([1,0,0]) == Version([1]))") // true
print("\(Version([1,0,0]) < Version([1]))") // false
print("\(Version([1,0,0]) < Version([1,1,0]))") // true
print("\(Version([1,0,0]) < Version([0,1,0]))") // false
print("\(Version([1,0,0]).bump())") // 1.1
print("\(Version([1,2,3]) + Version([1,0]))") // 2.2.3
print("\(Version([1,0]) + Version([1,1,1]))") // 2.1.1
print("\(Version([1,0]) - Version([1,1,1]))") // 0.0.0
print("\(Version([1,1,1]) - Version([0,0,1]))") // 1.1.0
