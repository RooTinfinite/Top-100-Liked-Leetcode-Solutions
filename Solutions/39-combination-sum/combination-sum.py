class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        def backtrack(start, path, target):
            # If the target is zero, we've found a valid combination
            if target == 0:
                fResult.append(path[:])  # Add a copy of the current path
                return
            # Iterate through candidates, starting from the current index
            for i in range(start, len(candidates)):
                candidate = candidates[i]
                if candidate <= target:
                    # Choose the candidate and backtrack with reduced target
                    path.append(candidate)
                    backtrack(i, path, target - candidate)  # Allow the same candidate again
                    # Backtrack step (remove the last chosen candidate)
                    path.pop()

        fResult = []
        candidates.sort()  # Sorting helps in pruning, though it's optional
        backtrack(0, [], target)
        return fResult
