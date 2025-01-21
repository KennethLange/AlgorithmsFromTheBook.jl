export coord_descent_least_squares

using LinearAlgebra

"""Minimizes ||b - A * x||^2 subject to l <= x <= u."""
function coord_descent_least_squares(A, b, l, u, tol) 
  (n, p) = size(A)
  (x, xnew) = (zeros(p), zeros(p))
  r = b - A * x # residuals
  for iter = 1:1000
    for j = 1:p
      xnew[j] = x[j] + dot(A[:,j], r) / norm(A[:, j])^2
      xnew[j] = clamp(xnew[j], l[j], u[j])
      r = r + A[:, j] * (x[j] - xnew[j]) 
    end
    conv = norm(xnew - x) # convergence test
    if conv < tol
      break
    else
      x .= xnew
    end    
  end
  return xnew
end



