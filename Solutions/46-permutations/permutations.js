/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var permute = function(nums) {
    const result = [];
    
    // Helper function to swap elements in array
    function swap(arr, i, j) {
        const temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    
    // Backtracking function to generate permutations
    function solve(nums, l, r) {
        if (l === r) {
            result.push([...nums]); // Create a copy of current permutation
            return;
        }
        
        for (let i = l; i <= r; i++) {
            swap(nums, l, i);
            solve(nums, l + 1, r);
            swap(nums, l, i);
        }
    }
    
    solve(nums, 0, nums.length - 1);
    return result;
};