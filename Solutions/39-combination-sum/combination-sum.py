class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        # Main function that takes a list of candidates and a target sum
        
        def backtrack(start, path, target):
            # Helper function for backtracking
            # start: starting index to consider candidates
            # path: current combination being built
            # target: remaining sum to achieve
            
            # Base case: if target becomes 0, we found a valid combination
            if target == 0:
                # Make a copy of current path and add to results
                fResult.append(path[:])
                return
            
            # Try each candidate starting from 'start' index
            for i in range(start, len(candidates)):
                candidate = candidates[i]
                
                # Only proceed if current candidate doesn't exceed remaining target
                if candidate <= target:
                    # Include current candidate in path
                    path.append(candidate)
                    
                    # Recursively try to find combinations
                    # We pass 'i' (not i+1) to allow reusing same number
                    backtrack(i, path, target - candidate)
                    
                    # Backtrack by removing the last added candidate
                    path.pop()
        
        # Initialize result list to store all valid combinations
        fResult = []
        
        # Sort candidates for optimization (optional but helpful)
        candidates.sort()
        
        # Start backtracking with empty path
        backtrack(0, [], target)
        
        return fResult