//: Playground - noun: a place where people can play

import UIKit

class Solution {

    func bubbleSort(_ arr: [Int], comparison: (Int, Int) -> Bool) -> [Int] {
        var arrCopy = arr

        // Iterate over entire array minus the last number
        var i = 0

        var didSwap = false

        while i < arrCopy.count {

            // In each iteration, iterate over entire array minus current index
            for index in 0...arrCopy.count - i {
                if index + 1 < arrCopy.count - i {
                    if !comparison(arrCopy[index], arrCopy[index + 1]) {
                        // swap so larger number is at the end
                        didSwap = true
                        arrCopy = swap(array: arrCopy, left: index, right: index + 1)
                    }
                }
            }

            if !didSwap {
                return arrCopy
            }

            i += 1
        }

        // return the result
        return arrCopy
    }

    func swap(array: [Int], left: Int, right: Int) -> [Int] {
        var arrayCopy = array
        arrayCopy[right] = array[left]
        arrayCopy[left] = array[right]
        return arrayCopy
    }

}

Solution().bubbleSort([9, 7, 4, 3, 5, 6, 8], comparison: <) // 3, 4, 5, 6, 7, 8, 9
Solution().bubbleSort([1, 2, 3, 4, 5], comparison: <) // 1, 2, 3, 4, 5
