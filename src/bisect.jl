export bisect

""" Implements the bisection algorithm for finding a root of
the equation f(x)=0. The constants a < b should bracket a 0."""
function bisect(f::Function, a::T, b::T, tol::T) where T <: Real
  (fa, fb) = (f(a), f(b))
  @assert(a < b && fa * fb <= zero(T)) # check for input error
  half = one(T) / 2
  for iteration = 1:100
    m = half * (a + b)
    fm = f(m)
    if abs(fm) < tol
      return (m, iteration)
    end
    if fa * fm < zero(T) 
      (b, fb) = (m, fm)
    else
      (a, fa) = (m, fm)
    end
  end
  return (half * (a + b), 100)
end
