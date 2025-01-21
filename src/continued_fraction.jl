export dcf, cfexp

"""Evaluates the continued fraction expansion of f at x."""
function continued_fraction(f, x::T, n::Integer) where T <: Number
  (a, b, b0) = f(x, n) # extract continued fraction coefficients
  y = zero(T)
  for i = n:-1:1 # evaluate n-fold composition
    y = a[i] / (b[i] + y)
  end
  return b0 + y
end

"""Computes the continued fraction coefficients of exp."""  
function cfexp(x::T, n::Integer) where T <: Number
  b0 = one(T)
  (a, b) = (zeros(T, n), zeros(T, n))
  (a[1], b[1]) = (x, one(T))
  for i = 2:n
    a[i] = - (i - 1) * x
    b[i] = i + x
  end
  return (a, b, b0)
end

"""Evaluates the function f and its derivative at x."""
function dcf(f::Function, x, h::Real, n::Integer)
  fvalue = real(continued_fraction(f::Function, x, n)) # value
  x = x +  h * im # perturb parameter
  df = imag(continued_fraction(f, x, n)) / h # derivative
  x = x - h * im # restore parameter
  return (fvalue, df) # value and derivative
end




