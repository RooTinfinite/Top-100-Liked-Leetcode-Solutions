func solveNQueens(n int) [][]string {
    board := make([]string, n)
    for i := range board {
        board[i] = strings.Repeat(".", n)
    }
    var result [][]string
    backtrack(0, &result, board, n)
    return result
}

func backtrack(row int, result *[][]string, board []string, n int) {
    if row == n {
        temp := make([]string, n)
        copy(temp, board)
        *result = append(*result, temp)
        return
    }
    
    for col := 0; col < n; col++ {
        if isValid(board, row, col, n) {
            newRow := []byte(board[row])
            newRow[col] = 'Q'
            board[row] = string(newRow)
            
            backtrack(row+1, result, board, n)
            
            newRow[col] = '.'
            board[row] = string(newRow)
        }
    }
}

func isValid(board []string, row, col, n int) bool {
    // Check column
    for i := 0; i < row; i++ {
        if board[i][col] == 'Q' {
            return false
        }
    }
    
    // Check upper left diagonal
    for i, j := row-1, col-1; i >= 0 && j >= 0; i, j = i-1, j-1 {
        if board[i][j] == 'Q' {
            return false
        }
    }
    
    // Check upper right diagonal
    for i, j := row-1, col+1; i >= 0 && j < n; i, j = i-1, j+1 {
        if board[i][j] == 'Q' {
            return false
        }
    }
    
    return true
}