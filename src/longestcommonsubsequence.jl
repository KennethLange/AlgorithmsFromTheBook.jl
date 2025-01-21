export lcs

"""Finds the length of the longest common subsequence of the 
sequences x and y."""
function lcs(x::Vector, y::Vector, m::Int, n::Int)
  if m == 0 || n == 0
    return 0
  elseif x[m] == y[n]
    return 1 + lcs(x, y, m - 1, n - 1)
  else
    return max(lcs(x, y, m - 1, n), lcs(x, y, m, n - 1))
  end
end

