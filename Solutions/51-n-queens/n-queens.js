/**
 * @param {number} n
 * @return {string[][]}
 */
var solveNQueens = function(n) {
    // Store all valid solutions
    const output = [];
    // Create n x n board filled with '.'
    const nQueens = Array(n).fill().map(() => Array(n).fill('.'));
    
    // Check if placing a queen at position (row,col) is valid
    function isSafePlace(row, col) {
        // Check if any queen exists in the same column above
        for (let i = 0; i < n; i++) {
            if (nQueens[i][col] === 'Q') {
                return false;
            }
        }
        
        // Check upper-left diagonal for queens
        // Move diagonally up and left until edge of board
        for (let i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--) {
            if (nQueens[i][j] === 'Q') {
                return false;
            }
        }
        
        // Check upper-right diagonal for queens
        // Move diagonally up and right until edge of board
        for (let i = row - 1, j = col + 1; i >= 0 && j < n; i--, j++) {
            if (nQueens[i][j] === 'Q') {
                return false;
            }
        }
        
        // Position is safe if no conflicts found
        return true;
    }
    
    // Recursive function to place queens row by row
    function solve(row) {
        // Base case: all queens are placed successfully
        if (row === n) {
            // Convert current board state to required string format
            output.push(nQueens.map(row => row.join('')));
            return;
        }
        
        // Try placing queen in each column of current row
        for (let col = 0; col < n; col++) {
            if (isSafePlace(row, col)) {
                // Place queen at current position
                nQueens[row][col] = 'Q';
                // Move to next row
                solve(row + 1);
                // Backtrack: remove queen to try next position
                nQueens[row][col] = '.';
            }
        }
    }
    
    // Start solving from first row (row 0)
    solve(0);
    return output;
};