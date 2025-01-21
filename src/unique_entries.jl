export unique_entries

function unique_entries(x::Vector)
  y = sort(x) # Julia's generic sort
  j = 1
  for i = 2:length(y)
    if y[i] != y[i - 1]
      j = j + 1
      y[j] = y[i]
    end
  end
  return y[1:j]
end
