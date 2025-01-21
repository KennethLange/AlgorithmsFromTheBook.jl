export mergesort

"""Sorts the entries of x by the mergesort method."""
function mergesort(x::Vector)
  if length(x) <= 1 return x end
  mid = div(length(x), 2) 
  left = mergesort(x[1:mid]) # sort left half
  right = mergesort(x[mid + 1:end]) # sort right half
  y = similar(x) # merge the two halves
  (i, j, k) = (1, 1, 1)
  while i <= length(left) && j <= length(right) 
    if left[i] <= right[j]
      y[k] = left[i] 
      i = i + 1
    else
      y[k] = right[j]
      j = j + 1
    end
    k = k + 1
  end
  if i <= length(left)
    y[k:end] .= left[i:end] # copy leftovers from left into y
  else
    y[k:end] .= right[j:end] # copy leftovers from right into y
  end
  return y
end


