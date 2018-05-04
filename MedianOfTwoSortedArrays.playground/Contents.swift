//: Playground - noun: a place where people can play

import UIKit

/*
 *  There are two sorted arrays nums1 and nums2 of size m and n respectively.
 *
 *  Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 */

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        guard nums1.count > 0 || nums2.count > 0 else { return 0.0 }
        if nums1.count == 0 && nums2.count % 2 != 0 {
            return Double(nums2[nums2.count/2])
        } else if nums2.count == 0 && nums1.count % 2 != 0 {
            return Double(nums1[nums1.count/2])
        } else if nums1.count == 1 && nums2.count == 1 {
            return (Double(nums1[0]) + Double(nums2[0]))/2
        }

        var numberOfNums = nums1.count + nums2.count

        // if is odd
        // get the middle index
        // iterate through with two pointers
        // combine the sorted nums as you go
        // when you reach the median index
        // return that number
        if numberOfNums % 2 != 0 {
            var medianIndex = numberOfNums/2

            var i = 0
            var j = 0
            var currentTotalIndex = 0
            var currentNum: Int
            var longest = nums1.count > nums2.count ? nums1 : nums2
            var shortest = nums1.count > nums2.count ? nums2 : nums1

            while i < longest.count {
                let left = longest[i]

                if shortest.count > j {
                    let right = shortest[j]

                    if left <= right {
                        currentNum = left
                        i += 1
                    } else {
                        currentNum = right
                        j += 1
                    }

                } else {
                    currentNum = left
                    i += 1
                }

                if currentTotalIndex == medianIndex {
                    return Double(currentNum)

                }

                currentTotalIndex += 1
            }

        }

        // if it is even
        // get the middle 2 indexes (by (count - 1) divided by 2 - then add 1 for the second index)
        // iterate through with two pointers
        // combine the sorted nums as yo ugo
        // when you reach the media index
        // return that number
        var medianIndexRight = numberOfNums/2
        var medianIndexLeft = medianIndexRight - 1
        var medianLeftNum: Double? = nil
        var medianRightNum: Double? = nil

        var i = 0
        var j = 0
        var currentTotalIndex = 0
        var currentNum: Int
        var longest = nums1.count > nums2.count ? nums1 : nums2
        var shortest = nums1.count > nums2.count ? nums2 : nums1

        while i < longest.count {
            let left = longest[i]

            if shortest.count > j {
                let right = shortest[j]

                if left <= right {
                    currentNum = left
                    i += 1
                } else {
                    currentNum = right
                    j += 1
                }

            } else {
                currentNum = left
                i += 1
            }

            if currentTotalIndex == medianIndexLeft {
                medianLeftNum = Double(currentNum)
            } else if currentTotalIndex == medianIndexRight {
                medianRightNum = Double(currentNum)
                return (medianLeftNum! + medianRightNum!)/2
            }

            currentTotalIndex += 1
        }

        while j < shortest.count {
            let right = shortest[j]
            currentNum = right
            j += 1

            if currentTotalIndex == medianIndexRight {
                medianRightNum = Double(currentNum)
                return (medianLeftNum! + medianRightNum!)/2
            }

            currentTotalIndex += 1
        }


        return 0.0
    }
}

Solution().findMedianSortedArrays([1], [1]) // 1.0
Solution().findMedianSortedArrays([], [1]) // 1.0
Solution().findMedianSortedArrays([4,5,6,8,9], []) // 6.0
Solution().findMedianSortedArrays([1,3], [2]) // 2.0
Solution().findMedianSortedArrays([1,2], [3,4]) // 2.5
Solution().findMedianSortedArrays([1,1], [1,1]) // 2.5
Solution().findMedianSortedArrays([1,2,3,4], [3,4,5,6]) // 3.5

