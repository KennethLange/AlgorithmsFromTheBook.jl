export babylonian

""" Computes the square root of c >= 0."""
function babylonian(c::T, tol::T) where T <: Real
  x = one(T)  # start x at 1
  half = one(T) / 2  # half = 0.5
  for n = 1:100
    x = half * (x + c / x)
    if abs(x^2 - c) < tol  # convergence test
      return x
    end
  end
end


