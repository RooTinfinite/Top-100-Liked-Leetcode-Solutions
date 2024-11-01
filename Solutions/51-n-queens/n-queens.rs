impl Solution {
    // Helper function to check if placing a queen at position (row,col) is safe
    fn is_safe_place(n: i32, n_queens: &Vec<String>, row: i32, col: i32) -> bool {
        // Check if there's any queen in the same column above current position
        for i in 0..row {
            if n_queens[i as usize].chars().nth(col as usize).unwrap() == 'Q' {
                return false;
            }
        }

        // Check upper-left diagonal for any queen
        let mut i = row - 1;
        let mut j = col - 1;
        while i >= 0 && j >= 0 {
            if n_queens[i as usize].chars().nth(j as usize).unwrap() == 'Q' {
                return false;
            }
            i -= 1;
            j -= 1;
        }

        // Check upper-right diagonal for any queen
        let mut i = row - 1;
        let mut j = col + 1;
        while i >= 0 && j < n {
            if n_queens[i as usize].chars().nth(j as usize).unwrap() == 'Q' {
                return false;
            }
            i -= 1;
            j += 1;
        }

        true
    }

    // Recursive helper function to solve N-Queens problem
    fn solve_n_queens_helper(n: i32, output: &mut Vec<Vec<String>>, n_queens: &mut Vec<String>, row: i32) {
        // Base case: if we've placed queens in all rows, we found a valid solution
        if row == n {
            output.push(n_queens.clone());
            return;
        }

        // Try placing queen in each column of current row
        for col in 0..n {
            // If current position is safe
            if Self::is_safe_place(n, n_queens, row, col) {
                // Place queen
                let mut row_str: String = n_queens[row as usize].clone();
                row_str.replace_range(col as usize..=col as usize, "Q");
                n_queens[row as usize] = row_str;

                // Recursively solve for next row
                Self::solve_n_queens_helper(n, output, n_queens, row + 1);

                // Backtrack: remove queen for trying next position
                let mut row_str: String = n_queens[row as usize].clone();
                row_str.replace_range(col as usize..=col as usize, ".");
                n_queens[row as usize] = row_str;
            }
        }
    }

    pub fn solve_n_queens(n: i32) -> Vec<Vec<String>> {
        let mut output: Vec<Vec<String>> = Vec::new();  // Stores all valid solutions
        let mut n_queens: Vec<String> = vec![".".repeat(n as usize); n as usize]; // Initialize empty board
        Self::solve_n_queens_helper(n, &mut output, &mut n_queens, 0); // Start solving from row 0
        output
    }
}