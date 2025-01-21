export exponential

using LinearAlgebra

"""Computes the exponential of x."""
function exponential(x)
  if length(x) == 1 # scalar case
    y = 1.0
    m  = max(exponent(256 * abs(x)), 0) # squarings
  else # square matrix case
    y = diagm(ones(size(x, 1))) # identity matrix
    m = max(exponent(256 * norm(x, 1)), 0) # squarings
  end
  t = copy(y) # term of exponential expansion
  u = (1 / 2^m) * x # reduced value of exponential argument
  for i = 1:5 # Approximate e^u by a six term series
    t = (u * t) / i
    y = y + t
  end
  for i = 1:m # Recover e^x by repeated squaring.
    y = y * y
  end
  return y
end