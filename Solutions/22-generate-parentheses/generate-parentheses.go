var combinations []string
var number int

func generateParenthesis(n int) []string {
	combinations = []string{}
	number = n

	backtrack("", 0, 0)

	return combinations
}

func backtrack(current string, open, close int) {
	if len(current) == number*2 {
		combinations = append(combinations, current)
		return
	}

	if open < number {
		backtrack(current+"(", open+1, close)
	}

	if close < open {
		backtrack(current+")", open, close+1)
	}
}