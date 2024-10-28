class Solution 
{
public:
    int longestSquareStreak(vector<int>& nums) 
    {
        auto isqrt = [](int n) { return (int)floor(sqrt(n)); };
        
        sort(nums.begin(), nums.end());
        nums.erase(unique(nums.begin(), nums.end()), nums.end());
        
        int s, c = 0;
        unordered_map<int,int> sqr;
        
        for (int n : nums)
        {
            sqr[n] = 1;
            while ((s = isqrt(n)) && s*s == n && sqr.count(s))
                sqr[s] += 1, n = s;
        }
        
        for (auto[n,s] : sqr) c = max(c,s);
        return c > 1 ? c : -1;
    }
};