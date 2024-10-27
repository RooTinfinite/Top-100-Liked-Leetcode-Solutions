class Solution {
    // Recursive helper function to find all combinations
    private func findCombinations(_ index: Int, _ target: Int, _ candidates: [Int], _ current: inout [Int], _ result: inout [[Int]]) {
        // Base case: if target becomes 0, we found a valid combination
        if target == 0 {
            result.append(current) // Add current combination to result
            return
        }
        
        // Try all possible numbers from current index
        for i in index..<candidates.count {
            // Only proceed if current number doesn't exceed target
            if candidates[i] <= target {
                // Include current number in combination
                current.append(candidates[i])
                
                // Recursive call with:
                // - same index i (allowing reuse of same number)
                // - reduced target by current number
                findCombinations(i, target - candidates[i], candidates, &current, &result)
                
                // Backtrack: remove the last added number to try other combinations
                current.removeLast()
            }
        }
    }
    
    // Main function that initiates the combination finding process
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []    // Stores all valid combinations
        var current: [Int] = []     // Temporary array to build combinations
        findCombinations(0, target, candidates, &current, &result)
        return result
    }
}