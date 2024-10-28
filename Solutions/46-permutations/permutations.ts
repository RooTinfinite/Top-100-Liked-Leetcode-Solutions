function permute(nums: number[]): number[][] {
  const permuations: number[][] = [];
  const chunks: number[] = [];

  function backtrack(flags: number) {
    if (chunks.length === nums.length) {
      permuations.push([...chunks]);
      return;
    }

    for (let i = 0; i < nums.length; i++) {
      if ((flags >> i) & 1) continue;
      chunks.push(nums[i]);
      backtrack(flags | (1 << i));
      chunks.pop();
    }
  }

  backtrack(0);
  return permuations;
}