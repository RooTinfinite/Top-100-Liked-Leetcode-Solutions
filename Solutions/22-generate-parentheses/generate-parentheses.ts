function generateParenthesis(n: number): string[] {
    const result = [];

    const generateSeq = (open: number, close: number, prefix: string) => {
        if(open > n || close > n || close > open) return;
        if(open === n && close === n){
            result.push(prefix);
            return;
        }
        generateSeq(open+1, close, prefix+'(');
        generateSeq(open, close+1, prefix+')');
    }

    generateSeq(0,0,'')

    return result;
};