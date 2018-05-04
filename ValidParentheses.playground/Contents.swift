//: Playground - noun: a place where people can play

import UIKit

class Solution {

    enum BracketType: String {
        case openBracket = "("
        case openBrace = "{"
        case openSquare = "["
        case closeBracket = ")"
        case closeBrace = "}"
        case closeSquare = "]"

        var opposite: BracketType {
            switch self {
            case .openBracket:
                return .closeBracket
            case .openBrace:
                return .closeBrace
            case .openSquare:
                return .closeSquare
            case .closeBracket:
                return .openBracket
            case .closeBrace:
                return .openBrace
            case .closeSquare:
                return .openSquare
            }
        }
    }

    func isValid(_ s: String) -> Bool {
        let chars = Array(s)
        guard chars.count > 0 else { return true }
        var openBrackets: [BracketType] = []
        for char in chars {
            if let bracket = BracketType(rawValue: String(char)) {
                switch bracket {
                case .openSquare, .openBracket, .openBrace:
                    openBrackets.append(bracket)
                case .closeSquare, .closeBracket, .closeBrace:
                    if let previousBracket = openBrackets.last {
                        if previousBracket == bracket.opposite {
                            openBrackets.removeLast()
                        } else {
                            return false
                        }
                    } else {
                        return false
                    }
                }
            }
        }
        return openBrackets.isEmpty
    }
}

func check<T: Equatable>(_ a: T, _ b: T) {
    if a == b {
        print("correct:\t\(a)")
    } else  {
        print("incorrect:\t\(a) should be \(b)")
    }
}

check(Solution().isValid(""), true)
check(Solution().isValid("()"), true)
check(Solution().isValid("()[]{}"), true)
check(Solution().isValid("(]"), false)
check(Solution().isValid("([)]"), false)
check(Solution().isValid("{[]}"), true)
