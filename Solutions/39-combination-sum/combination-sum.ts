function combinationSum(candidates: number[], target: number): number[][] {
    const result: number[][] = [];
    
    function findCombinations(index: number, target: number, current: number[]): void {
        if (target === 0) {
            result.push([...current]);
            return;
        }
        
        for (let i = index; i < candidates.length; i++) {
            if (candidates[i] <= target) {
                current.push(candidates[i]);
                findCombinations(i, target - candidates[i], current);
                current.pop();
            }
        }
    }
    
    findCombinations(0, target, []);
    return result;
}