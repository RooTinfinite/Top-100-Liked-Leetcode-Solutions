class Solution {
    private func isSafePlace(_ n: Int, _ nQueens: [String], _ row: Int, _ col: Int) -> Bool {
        for i in 0..<n {
            if Array(nQueens[i])[col] == "Q" {
                return false
            }
        }
        
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0 {
            if Array(nQueens[i])[j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if Array(nQueens[i])[j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        return true
    }
    
    private func solveNQueens(_ n: Int, _ output: inout [[String]], _ nQueens: inout [String], _ row: Int) {
        if row == n {
            output.append(nQueens)
            return
        }
        
        for col in 0..<n {
            if isSafePlace(n, nQueens, row, col) {
                var rowArray = Array(nQueens[row])
                rowArray[col] = "Q"
                nQueens[row] = String(rowArray)
                
                solveNQueens(n, &output, &nQueens, row + 1)
                
                rowArray[col] = "."
                nQueens[row] = String(rowArray)
            }
        }
    }
    
    func solveNQueens(_ n: Int) -> [[String]] {
        var output: [[String]] = []
        var nQueens = Array(repeating: String(repeating: ".", count: n), count: n)
        solveNQueens(n, &output, &nQueens, 0)
        return output
    }
}