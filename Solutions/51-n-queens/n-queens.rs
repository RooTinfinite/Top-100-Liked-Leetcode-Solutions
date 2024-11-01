impl Solution {
    pub fn solve_n_queens(n: i32) -> Vec<Vec<String>> {
    let mut sol: Vec<Vec<String>> = Vec::with_capacity(n as usize);
    backtrack(&mut sol, &mut Vec::new(), n);
    sol
}

}


fn backtrack(sol: &mut Vec<Vec<String>>, curr: &mut Vec<i32>, n: i32) {
    if curr.len() == n as usize {
        let mut sub_sol = Vec::new();
        for i in 0..n {
            let chars = (0..n)
                .map(|x| if x == curr[i as usize] { "Q" } else { "." })
                .collect::<String>();
            sub_sol.push(chars);
        }
        sol.push(sub_sol);
    }
    for i in 0..n {
        if curr.contains(&i) {
            continue;
        }
        let curr_size = curr.len();
        let mut is_lgtm = true;
        for j in 0..curr_size {
            if (curr[j] - i).abs() == curr_size as i32 - j as i32 {
                is_lgtm = false;
                break;
            }
        }
        if !is_lgtm {
            continue;
        }

        curr.push(i);
        backtrack(sol, curr, n);
        curr.pop();
    }
}