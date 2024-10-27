func permute(nums []int) [][]int {
    var res [][]int
    
    permutation := make([]int, len(nums))
    visit := make([]bool, len(nums))
    
    var backtrack func(int)
    backtrack = func(index int) {
        if index == len(nums) {
            copiedPermutation := make([]int, len(nums))
            copy(copiedPermutation, permutation)
            
            res = append(res, copiedPermutation)
            
            return
        }   
        
        for i := 0; i < len(nums); i++ {
            if visit[i] == false {
                visit[i] = true
                permutation[index] = nums[i]
                backtrack(index+1)   
                visit[i] = false
            }
        }
    }
    
    backtrack(0)
    
    return res
}