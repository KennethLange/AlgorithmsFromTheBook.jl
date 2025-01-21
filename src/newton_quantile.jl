export Quantile

using Distributions

"""Finds the q quantile of a unimodal distribution."""
function Quantile(dist, q, tol)
  x = mode(dist)
  while abs(cdf(dist, x) - q) > tol
    x = x + (q - cdf(dist, x)) / pdf(dist, x)
  end
  return x
end

