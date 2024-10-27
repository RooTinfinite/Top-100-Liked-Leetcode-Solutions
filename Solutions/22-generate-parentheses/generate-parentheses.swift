class Solution {
    // Function that generates all valid combinations of n pairs of parentheses
    func generateParenthesis(_ n: Int) -> [String] {
        // Stack to build current combination
        var stack: [String] = []
        // Array to store all valid combinations
        var res: [String] = []
        
        // Recursive backtracking function
        // open: count of opening brackets used
        // close: count of closing brackets used
        func backtrack(_ open: Int, _ close: Int) {
            // Base case: when we have used n opening and n closing brackets
            // we have a valid combination
            if open == close && close == n {
                // Join all characters in stack and add to result
                res.append(stack.joined())
                return
            }
            
            // If we haven't used all opening brackets yet
            // we can add an opening bracket
            if open < n {
                stack.append("(")                // Add opening bracket
                backtrack(open + 1, close)       // Recurse with one more opening bracket
                stack.removeLast()               // Backtrack by removing the bracket
            }
            
            // If we have more opening brackets than closing brackets
            // we can add a closing bracket
            if close < open {
                stack.append(")")                // Add closing bracket
                backtrack(open, close + 1)       // Recurse with one more closing bracket
                stack.removeLast()               // Backtrack by removing the bracket
            }
        }
        
        // Start the recursion with 0 opening and closing brackets
        backtrack(0, 0)
        return res
    }
}

