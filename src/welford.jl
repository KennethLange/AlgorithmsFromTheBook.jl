export minimum_variance

"""Updates the sample mean and variance of a sequence of n numbers by
inserting the new number x."""
function welford_update(x, avg, var, p)
  avg = (p * avg + x) / (p + 1)
  var = p * var / (p + 1) + (x - avg)^2 / p
  return (avg, var)
end

"""Updates the sample mean and variance of a sequence of n numbers by
deleting the existing number x. Do not use when n <= 1."""
function welford_downdate(x, avg, var, p)
  a = avg
  avg = (p * a - x) / (p - 1)
  var = p * var / (p - 1) - p * (x - a)^2 / (p - 1)^2
  return (avg, var)
end


"""Finds the subsample of x of size s with the lowest sample variance."""
function minimum_variance(x, s)
  sort!(x)
  (n, start, stop) = (length(x), 1, s)
  avg = sum(x[1:s]) / s # initial sample mean
  var = sum((x[1:s] .- avg).^2) / s # initial sample variance
  (best, best_start) = (var, 1)
  while stop < n
    (avg, var) = welford_downdate(x[start], avg, var, s)
    (start, stop) = (start + 1, stop + 1)
    (avg, var) = welford_update(x[stop], avg, var, s - 1)
    if var < best # check for improvement
      best = var
      best_start = start
    end
  end
  return x[best_start: best_start + s - 1]
end
