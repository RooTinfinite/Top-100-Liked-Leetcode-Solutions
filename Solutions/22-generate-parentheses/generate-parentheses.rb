def generate_parenthesis(n)
    @result = []
    solve("", 0, 0, n)
    @result
end

def solve(s, open, close, n)
    if close == n && open == n
        @result.push(s)
        return
    end
    
    if open < n
        solve(s + "(", open + 1, close, n)
    end
    
    if close < open
        solve(s + ")", open, close + 1, n)
    end
end