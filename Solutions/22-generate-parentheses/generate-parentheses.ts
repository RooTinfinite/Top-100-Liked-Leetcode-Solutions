function generateParenthesis(n: number): string[] {
    const ans: string[] = [];
    
    function solve(s: string, open: number, close: number): void {
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
}