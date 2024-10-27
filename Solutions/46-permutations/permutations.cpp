class Solution {
public:
    void solve(vector<int>& nums, int l, int r, vector<vector<int>>& result) {
        if (l == r) {
            result.push_back(nums);
            return;
        }
        for (int i = l; i <= r; i++) {
            swap(nums[l], nums[i]);
            solve(nums, l + 1, r, result);
            swap(nums[l], nums[i]);
        }
    }

    vector<vector<int>> permute(vector<int>& nums) {
        vector<vector<int>> result;
        solve(nums, 0, nums.size() - 1, result);
        return result;
    }
};