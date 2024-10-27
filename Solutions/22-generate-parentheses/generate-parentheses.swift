class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var stack: [String] = []
        var res: [String] = []

        func backtrack(_ open: Int, _ close: Int) {
            if open == close && close == n {
                res.append(stack.joined())
                return
            }

            if open < n {
                stack.append("(")
                backtrack(open + 1, close)
                stack.removeLast()
            }

            if close < open {
                stack.append(")")
                backtrack(open, close + 1)
                stack.removeLast()
            }
        }

        backtrack(0, 0)
        return res
    }
}