function solveNQueens(n: number): string[][] {
    const board: string[] = Array(n).fill('.'.repeat(n));
    const result: string[][] = [];
    
    function isSafe(row: number, col: number): boolean {
        // Check column
        for (let i = 0; i < row; i++) {
            if (board[i][col] === 'Q') return false;
        }
        
        // Check upper-left diagonal
        for (let i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--) {
            if (board[i][j] === 'Q') return false;
        }
        
        // Check upper-right diagonal
        for (let i = row - 1, j = col + 1; i >= 0 && j < n; i--, j++) {
            if (board[i][j] === 'Q') return false;
        }
        
        return true;
    }
    
    function backtrack(row: number): void {
        if (row === n) {
            result.push([...board]);
            return;
        }
        
        for (let col = 0; col < n; col++) {
            if (isSafe(row, col)) {
                board[row] = board[row].substring(0, col) + 'Q' + board[row].substring(col + 1);
                backtrack(row + 1);
                board[row] = board[row].substring(0, col) + '.' + board[row].substring(col + 1);
            }
        }
    }
    
    backtrack(0);
    return result;
}

