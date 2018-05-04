//: Playground - noun: a place where people can play

import Foundation

class Solution {

    func solveSudoku(_ board: inout [[Character]]) {
        var didFindAnEmptyBox = false

        var i = 0
        rowLoop: while i < board.count {

            var j = 0
            columnLoop: while j < board[i].count {
                guard board[i][j] == "." else {
                    j += 1
                    continue columnLoop
                }
                didFindAnEmptyBox = true

                let subBoxValues = subBox(atRow: i, columnIndex: j, board: board)

                let currentMatches = matches(rowValues: board[i],
                                             columnValues: column(atIndex: j, board: board),
                                             subBoxValues: subBoxValues)
                if currentMatches.count == 1 {
                    board[i][j] = currentMatches[0]
                }

                // check row
                // check column

                // check subbox

                // SubBox Row Start/End Index
                var rowStartIndex = 0
                var rowEndIndex = 2
                if i >= 3 && i < 6 {
                    rowStartIndex = 3
                    rowEndIndex = 5
                } else if i >= 6 {
                    rowStartIndex = 6
                    rowEndIndex = 8
                }

                // SubBox Column Start/End Index
                var columnStartIndex = 0
                var columnEndIndex = 2
                if j >= 3 && j < 6 {
                    columnStartIndex = 3
                    columnEndIndex = 5
                } else if j >= 6 {
                    columnStartIndex = 6
                    columnEndIndex = 8
                }

                let remainingInSubBox = remaining(inSubbox: subBoxValues)

                var numberOfMatches = 0
                var l = rowEndIndex
                while l <= rowEndIndex {

                    var m = columnStartIndex
                    while m <= columnEndIndex {

                        for remaining in remainingInSubBox {
                            if matches(rowValues: board[l],
                                       columnValues: column(atIndex: m, board: board),
                                       subBoxValues: subBoxValues).contains(remaining) {
                                
                            }
                        }


                    }

                }

                j += 1
            }

            i += 1
        }

        if didFindAnEmptyBox {
            //print(board)
            solveSudoku(&board)
        }
    }

    func matches(rowValues: [Character], columnValues: [Character], subBoxValues: [Character]) -> [Character] {
        var output: [Character] = []
        let nums: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for num in nums {
            if !rowValues.contains(num) && !columnValues.contains(num) && !subBoxValues.contains(num) {
                output.append(num)
            }
        }
        return output
    }

}

// MARK: - Columns and Rows

extension Solution {

    func column(atIndex index: Int, board: [[Character]]) -> [Character] {
        if board[0].count > index && index >= 0 {
            var output: [Character] = []
            for row in board {
                output.append(row[index])
            }
            return output
        }
        fatalError("index out of bounds")
    }

    func subBox(atRow rowIndex: Int, columnIndex: Int, board: [[Character]]) -> [Character] {
        if board.count > rowIndex && rowIndex >= 0
            && board[0].count > columnIndex && columnIndex >= 0 {
            var output: [Character] = []
            var columnStartIndex = 0
            var columnEndIndex = 2
            if columnIndex >= 3 && columnIndex < 6 {
                columnStartIndex = 3
                columnEndIndex = 5
            } else if columnIndex >= 6 {
                columnStartIndex = 6
                columnEndIndex = 8
            }
            for currentColumnIndex in columnStartIndex...columnEndIndex {
                output += Array(column(atIndex: currentColumnIndex, board: board)[0...2])
            }
            return output
        }
        fatalError("index out of bounds")
    }

    func remaining(inSubbox subbox: [Character]) -> [Character] {
        let nums: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var output: [Character] = []
        for num in nums {
            if !subbox.contains(num) {
                output.append(num)
            }
        }
        return output
    }

}

// MARK: - IndexPath

extension Solution {

    struct IndexPath: Hashable, Equatable {
        var row: Int
        var column: Int

        var hashValue: Int {
            return "\(row)\(column)".hashValue
        }

        init(row: Int, column: Int) {
            self.row = row
            self.column = column
        }

        static func == (lhs: IndexPath, rhs: IndexPath) -> Bool {
            return lhs.row == rhs.row && lhs.column == rhs.column
        }

    }

}

var board: [[Character]] = [["5","3","4",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
//Solution().solveSudoku(&board)

