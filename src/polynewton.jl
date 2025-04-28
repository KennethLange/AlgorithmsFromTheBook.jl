export poly_newton

"""Evaluates the polynomial p(x)=c_1+c_2*x+c_{n}*x^{n-1} 
and its derivative."""
function horner(c::Vector{T}, x::T) where T <: Real
  n = length(c)
  p = c[n]
  dp = zero(T)
  for i = (n - 1):-1:1
    dp = dp * x + p
    p = c[i] + p * x
  end
  return (p, dp) # value and derivative
end

""" Implements Newton's method for finding a root of the 
polynomial equation p(x) = 0. dp is the derivative of p(x), 
and c contains the coefficients defining p. All roots
of p(x) should be real."""
function poly_newton(c::Vector{T}, x::T, tol::T) where T <: Real
  (xold, xnew, pnew) = (x, zero(x), zero(T))
  (p, dp) = horner(c, xold)
#  println(0," ",0," ",round(xold, digits=7),"  ",formatted(p, ndigits=7))
  for iteration = 1:100
    increment = - p / dp # Newton increment
    steps = 0
    for step = 0:5 # step halving
      xnew = xold + increment
      (pnew, dp) = horner(c, xnew)
      if abs(pnew) < abs(p) # test for decrease
        break
      else
        xnew = xnew + increment
        increment = increment / 2
        steps = steps + 1
      end
    end
#  println(iteration," ",steps," ",round(xnew, digits=7),"  ",formatted(pnew, ndigits=7)) 
    if abs(pnew) < tol # convergence test
      return (xnew, iteration)
    end
    (xold, p) = (xnew, pnew)
  end
  return (xnew, 100)
end

