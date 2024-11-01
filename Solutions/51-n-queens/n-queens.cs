public class Solution {
    // Helper function to check if placing a queen at position (row,col) is safe
    private bool IsSafePlace(int n, List<string> nQueens, int row, int col) {
        // Check if there's any queen in the same column above current position
        for (int i = 0; i < n; i++) {
            if (nQueens[i][col] == 'Q') {
                return false;
            }
        }

        // Check upper-left diagonal for any queen
        for (int i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--) {
            if (nQueens[i][j] == 'Q') {
                return false;
            }
        }

        // Check upper-right diagonal for any queen
        for (int i = row - 1, j = col + 1; i >= 0 && j < n; i--, j++) {
            if (nQueens[i][j] == 'Q') {
                return false;
            }
        }

        // If no conflicts found, position is safe
        return true;
    }

    // Recursive helper function to solve N-Queens problem
    private void SolveNQueens(int n, IList<IList<string>> output, List<string> nQueens, int row) {
        // Base case: if we've placed queens in all rows, we found a valid solution
        if (row == n) {
            output.Add(new List<string>(nQueens));
            return;
        }

        // Try placing queen in each column of current row
        for (int col = 0; col < n; col++) {
            // If current position is safe
            if (IsSafePlace(n, nQueens, row, col)) {
                // Place queen
                char[] rowChars = nQueens[row].ToCharArray();
                rowChars[col] = 'Q';
                nQueens[row] = new string(rowChars);
                
                // Recursively solve for next row
                SolveNQueens(n, output, nQueens, row + 1);
                
                // Backtrack: remove queen for trying next position
                rowChars[col] = '.';
                nQueens[row] = new string(rowChars);
            }
        }
    }

    // Main function to solve N-Queens problem
    public IList<IList<string>> SolveNQueens(int n) {
        IList<IList<string>> output = new List<IList<string>>();  // Stores all valid solutions
        List<string> nQueens = new List<string>(); // Initialize empty board
        
        // Initialize the board with empty squares
        for (int i = 0; i < n; i++) {
            nQueens.Add(new string('.', n));
        }
        
        SolveNQueens(n, output, nQueens, 0); // Start solving from row 0
        return output;
    }
}