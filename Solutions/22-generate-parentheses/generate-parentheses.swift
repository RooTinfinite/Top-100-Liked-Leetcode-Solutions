class Solution {
    // Helper function that generates valid parentheses combinations recursively
    func solve(_ ans: inout [String], _ s: inout String, _ open: Int, _ close: Int, _ n: Int) {
        // Base case: when we have used n opening and n closing brackets
        if close == n && open == n {
            ans.append(s)
            return
        }
        
        // Case 1: We can add an opening bracket if we haven't used all n
        if open < n {
            s.append("(")
            solve(&ans, &s, open + 1, close, n)
            s.removeLast()
        }
        
        // Case 2: We can add a closing bracket if we have more opening brackets
        if close < open {
            s.append(")")
            solve(&ans, &s, open, close + 1, n)
            s.removeLast()
        }
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var ans = [String]()
        var s = ""
        solve(&ans, &s, 0, 0, n)
        return ans
    }
}