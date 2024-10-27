def generate_parenthesis(n)
  ans = []
  dfs(n, n, "", ans)
  ans
end


def dfs(left_remain, right_remain, str, ans)
  if left_remain == 0 and right_remain == 0
    ans << str
    return
  end

  if left_remain > 0
    dfs(left_remain - 1,   right_remain, str + "(", ans)
  end

  if left_remain < right_remain
    dfs(left_remain, right_remain - 1, str + ")", ans)
  end
end