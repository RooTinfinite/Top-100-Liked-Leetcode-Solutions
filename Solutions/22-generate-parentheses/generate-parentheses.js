/**
 * @param {number} n
 * @return {string[]}
 */
var generateParenthesis = function(n) {
    const ans = [];
    
    function solve(s, open, close) {
        if (close === n && open === n) {
            ans.push(s);
            return;
        }
        
        if (open < n) {
            solve(s + "(", open + 1, close);
        }
        
        if (close < open) {
            solve(s + ")", open, close + 1);
        }
    }
    
    solve("", 0, 0);
    return ans;
};