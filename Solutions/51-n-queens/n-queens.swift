class Solution {
    // Helper function to check if placing a queen at position (row,col) is safe
    private func isSafePlace(_ n: Int, _ nQueens: [String], _ row: Int, _ col: Int) -> Bool {
        // Check if there's any queen in the same column above current position
        for i in 0..<n {
            if Array(nQueens[i])[col] == "Q" {
                return false
            }
        }
        
        // Check upper-left diagonal for any queen
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0 {
            if Array(nQueens[i])[j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        // Check upper-right diagonal for any queen
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if Array(nQueens[i])[j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        // If no conflicts found, position is safe
        return true
    }
    
    // Recursive helper function to solve N-Queens problem
    private func solveNQueens(_ n: Int, _ output: inout [[String]], _ nQueens: inout [String], _ row: Int) {
        // Base case: if we've placed queens in all rows, we found a valid solution
        if row == n {
            output.append(nQueens)
            return
        }
        
        // Try placing queen in each column of current row
        for col in 0..<n {
            // If current position is safe
            if isSafePlace(n, nQueens, row, col) {
                // Place queen
                var rowArray = Array(nQueens[row])
                rowArray[col] = "Q"
                nQueens[row] = String(rowArray)
                
                // Recursively solve for next row
                solveNQueens(n, &output, &nQueens, row + 1)
                
                // Backtrack: remove queen for trying next position
                rowArray[col] = "."
                nQueens[row] = String(rowArray)
            }
        }
    }
    
    // Main function to solve N-Queens problem
    func solveNQueens(_ n: Int) -> [[String]] {
        var output: [[String]] = []  // Stores all valid solutions
        var nQueens = Array(repeating: String(repeating: ".", count: n), count: n) // Initialize empty board
        solveNQueens(n, &output, &nQueens, 0) // Start solving from row 0
        return output
    }
}