class Solution {
    // Helper function that generates all permutations using backtracking
    private void solve(int[] nums, int l, int r, List<List<Integer>> result) {
        if (l == r) {
            List<Integer> temp = new ArrayList<>();
            for (int num : nums) {
                temp.add(num);
            }
            result.add(temp);
            return;
        }
        
        for (int i = l; i <= r; i++) {
            swap(nums, l, i);
            solve(nums, l + 1, r, result);
            swap(nums, l, i);
        }
    }
    
    // Helper function to swap elements in array
    private void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> result = new ArrayList<>();
        solve(nums, 0, nums.length - 1, result);
        return result;
    }
}

