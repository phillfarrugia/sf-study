//: Playground - noun: a place where people can play

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var left: [Int: [Int]] = [:]
        var right: [Int: [Int]] = [:]
        var intersection: [Int] = []

        for num in nums1 {
            if let _ = left[num] {
                left[num]!.append(num)
            } else {
                left[num] = [num]
            }
        }

        for num in nums2 {
            if let _ = right[num] {
                right[num]!.append(num)
            } else {
                right[num] = [num]
            }
        }

        for num in left.keys {
            if right[num] != nil {
                let leftCount = left[num]!.count
                let rightCount = right[num]!.count

                if leftCount < rightCount {
                    intersection += left[num]!
                } else {
                    intersection += right[num]!
                }
            }
        }

        return intersection
    }
}

print(Solution().intersect([1], []))
