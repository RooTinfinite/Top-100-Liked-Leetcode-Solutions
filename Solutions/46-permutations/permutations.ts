function permute(nums: number[]): number[][] {
    const result: number[][] = [];

    // Helper function to perform backtracking
    function backtrack(path: number[], remaining: number[]) {
        if (remaining.length === 0) {
            result.push([...path]); // If no remaining numbers, add the current path to result
        } else {
            for (let i = 0; i < remaining.length; i++) {
                path.push(remaining[i]); // Choose the next number
                backtrack(path, remaining.slice(0, i).concat(remaining.slice(i + 1))); // Explore with the chosen number
                path.pop(); // Un-choose the number to backtrack
            }
        }
    }

    backtrack([], nums); // Initialize backtracking with an empty path
    return result;
}