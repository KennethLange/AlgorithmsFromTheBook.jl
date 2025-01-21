export lis

"""Finds the longest increasing subsequence (lis) of the sequence x."""
function lis(x::Vector)
  n = length(x)
  if n == 0 return x end
  L = Array{Array{eltype(x)}, 1}(undef, n)
  L[1] = [x[1]]
  for i = 2:n
    longest = [] # lis before i and consistent with x[i]
    for j = 1:(i - 1)
      if (x[j] < x[i]) && (length(L[j]) >= length(longest))
        longest = L[j]
      end
    end
    L[i] = vcat(longest, x[i])
  end
  return L[argmax(length.(L))]
end