export peasant_divrem

"""Divides m >= 0 by n > 0 with remainder."""
function peasant_divrem(m::Int, n::Int)
  @assert(m >= 0 && n > 0)
  if m == n
    return (1, 0)
  elseif m < n
    return (0, m)
  end
  i = 0
  while n << i < m # n * 2^i < m
    i = i + 1
  end
  i = i - 1
  a = 1 << i # 2^i
  b = n << i # n * 2^i
  while i > 0
    i = i - 1
    if n << i + b <= m
      a = a + 1 << i
      b = b + n << i
    end
  end
  return (a, m - b)
end    


