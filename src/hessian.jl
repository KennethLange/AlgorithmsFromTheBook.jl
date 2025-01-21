export hessian, g

"""Finds the Hessian of the function f at x."""
function hessian(f::Function, x, d)
  d2f = zeros(length(x), length(x)) # hessian
  dx = d * (1.0 + 1.0 * im) / sqrt(2)
  for j = 1:length(x) # compute diagonal entries of d2f
    x[j] = x[j] + dx
    fplus = f(x)
    x[j] = x[j] - 2 * dx
    fminus = f(x)
    x[j] = complex(real(x[j]), 0.0) # reset parameter
    d2f[j, j]  = imag(fplus + fminus) / d^2
  end
  for j = 2:length(x) # compute off diagonal entries
   for k = 1:(j - 1)
     (x[j], x[k]) = (x[j] + dx, x[k] + dx)
     fplus = f(x)
     (x[j], x[k]) = (x[j] - 2 * dx, x[k] - 2 * dx)
     fminus = f(x)
     (x[j], x[k]) = (complex(real(x[j]), 0.0), complex(real(x[k]), 0.0))
     d2f[j, k]  = imag(fplus + fminus) / d^2
     d2f[j, k] = (d2f[j, k] - d2f[j, j] - d2f[k, k]) / 2
     d2f[k, j] = d2f[j, k]
   end
 end
 return d2f
end

function g(x)
  return exp(x[1]) / (sin(x[1])^3 + cos(x[1])^3)
end

