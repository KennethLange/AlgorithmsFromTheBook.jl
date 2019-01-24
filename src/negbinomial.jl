export negbinomial

"""Estimates both parameters of the negative binomial 
distribution."""
function negbinomial(x::Vector{Int})
  m = length(x)
  (p, r) = (0.5, 1.)
  (old_p, old_r) = (0.5, 1.)
  avg = mean(x)
  for iteration = 1:500
    s = 0.0
    for i = 1:m
      for j = 0:(x[i] - 1)
        s = s + r / (r + j)
      end
    end
    r = -s / (m * log(p))
    p = r / (r + avg)
    if abs(p - old_p) + abs(r - old_r) < 1e-6
      break
    end
    (old_p, old_r) = (p, r)
  end
  return (p, r)   
end
