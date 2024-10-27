class Solution {
public:
    vector<vector<int>>ans;
    void backtrack(vector<int>&arr,int start,int rem,vector<int>&temp){
        if(rem<0)return;
        if(rem==0)ans.push_back(temp);

        for(int i=start;i<arr.size();i++){
            temp.push_back(arr[i]);
            backtrack(arr,i,rem-arr[i],temp);
            temp.pop_back();
        }
    }
    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
        vector<int>temp;
        backtrack(candidates,0,target,temp);
        return ans;
    }
};