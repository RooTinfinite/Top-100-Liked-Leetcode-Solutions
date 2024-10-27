class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        def backtrack(start, path, target):
            if target == 0:
                fResult.append(path[:])
                return
            for i in range(start, len(candidates)):
                candidate = candidates[i]
                if candidate <= target:
                    path.append(candidate)
                    backtrack(i, path, target - candidate)
                    path.pop()
                    
        fResult = []
        candidates.sort()
        backtrack(0, [], target)
        return fResult
