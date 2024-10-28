class Solution:
    def longestSquareStreak(self, nums: List[int]) -> int:
        
        sqr = Counter(sorted(set(nums)))
        
        for n in sqr:
            while (s:=isqrt(n))**2 == n and s in sqr:
                sqr[s] += 1
                n = s

        return c if (c:=max(sqr.values())) >= 2 else -1