def solve_n_queens(n)
    @output = []  # Stores all valid solutions
    n_queens = Array.new(n) { '.' * n }  # Initialize empty board
    solve_n_queens_helper(n, n_queens, 0)
    @output
end

private

# Helper function to check if placing a queen at position (row,col) is safe
def is_safe_place(n, n_queens, row, col)
    # Check if there's any queen in the same column above current position
    (0...n).each do |i|
        return false if n_queens[i][col] == 'Q'
    end

    # Check upper-left diagonal for any queen
    i, j = row - 1, col - 1
    while i >= 0 && j >= 0
        return false if n_queens[i][j] == 'Q'
        i -= 1
        j -= 1
    end

    # Check upper-right diagonal for any queen
    i, j = row - 1, col + 1
    while i >= 0 && j < n
        return false if n_queens[i][j] == 'Q'
        i -= 1
        j += 1
    end

    # If no conflicts found, position is safe
    true
end

# Recursive helper function to solve N-Queens problem
def solve_n_queens_helper(n, n_queens, row)
    # Base case: if we've placed queens in all rows, we found a valid solution
    if row == n
        @output.push(n_queens.map(&:clone))
        return
    end

    # Try placing queen in each column of current row
    (0...n).each do |col|
        # If current position is safe
        if is_safe_place(n, n_queens, row, col)
            # Place queen
            n_queens[row][col] = 'Q'
            # Recursively solve for next row
            solve_n_queens_helper(n, n_queens, row + 1)
            # Backtrack: remove queen for trying next position
            n_queens[row][col] = '.'
        end
    end
end