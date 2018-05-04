//: Playground - noun: a place where people can play

import UIKit

// Given a 2d grid map of '1's (land) and '0's (water), count the number of islands.
// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
// You may assume all four edges of the grid are all surrounded by water.

class Solution {

    func numIslands(_ grid: [[Character]]) -> Int {
        var gridCopy = grid
        return numIslandsMutable(&gridCopy)
    }

    func numIslandsMutable(_ grid: inout [[Character]]) -> Int {
        var islandCount = 0

        for rowIndex in 0..<grid.count {
            let row = grid[rowIndex]
            for columnIndex in 0..<row.count {
                if grid[rowIndex][columnIndex] == "1" {
                    islandCount += 1
                    zeroIsland(row: rowIndex, column: columnIndex, grid: &grid)
                }
            }
        }

        return islandCount
    }

    func zeroIsland(row: Int, column: Int, grid: inout [[Character]]) {
        guard row < grid.count, row >= 0 else { return }
        let rowChars = grid[row]
        guard column < rowChars.count, column >= 0 else { return }
        let char = rowChars[column]

        if grid[row][column] == "1" {
            grid[row][column] = "0"

            // Recurse until have reached all 0s in this island
            zeroIsland(row: row-1, column: column, grid: &grid)
            zeroIsland(row: row+1, column: column, grid: &grid)
            zeroIsland(row: row, column: column-1, grid: &grid)
            zeroIsland(row: row, column: column+1, grid: &grid)
        }
    }

}

func check<T: Equatable>(_ a: T, _ b: T) {
    if a == b {
        print("correct:\t\(a)")
    } else  {
        print("incorrect:\t\(a) should be \(b)")
    }
}

check(Solution().numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]), 1)


