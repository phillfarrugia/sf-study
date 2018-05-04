//: Playground - noun: a place where people can play

class Solution {

    static let alphabet: [String: Int] = [
        "a": 0,
        "b": 1,
        "c": 2,
        "d": 3,
        "e": 4,
        "f": 5,
        "g": 6,
        "h": 7,
        "i": 8,
        "j": 9,
        "k": 10,
        "l": 11,
        "m": 12,
        "n": 13,
        "o": 14,
        "p": 15,
        "q": 16,
        "r": 17,
        "s": 18,
        "t": 19,
        "u": 20,
        "v": 21,
        "w": 22,
        "x": 23,
        "y": 24,
        "z": 25
    ]

    func isAnagram(_ s: String, _ t: String) -> Bool {

        let sSorted = sort(s)
        let tSorted = sort(t)

        return sSorted == tSorted
    }

    func sort(_ s: String) -> String {
        return String(s.sorted(by: { (left, right) -> Bool in
            var leftPriority = Solution.alphabet[String(left)]!
            var rightPriority = Solution.alphabet[String(right)]!
            return leftPriority < rightPriority
        }))
    }

    func old_isAnagram(_ s: String, _ t: String) -> Bool {
        // Step 1: Sort s in alphabetical order
        let sortedS = s.sorted()

        // Step 2: Sort t in alphabetical order
        let sortedT = t.sorted()

        // Step 3: Return true if equal, return false if unequal
        return sortedS == sortedT
    }

}

let result = Solution().isAnagram("anagram", "nagaram") // true
let result2 = Solution().isAnagram("rat", "car") // false
