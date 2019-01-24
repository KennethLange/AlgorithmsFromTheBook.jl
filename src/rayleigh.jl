using LinearAlgebra
export rayleigh, power_method

"""Finds an eigenvalue and corresponding eigenvector close
to the initial vector v."""
function rayleigh(A::Matrix{T}, v::Vector{T}, tol::T) where T <: Real
  v = v / norm(v)
  mu = dot(v, A * v)
  for i = 1:10
    u = (A - mu * I) \ v
    u = u / norm(u)
    mu = dot(u, A * u)
    test = norm(u - v)
    v = copy(u)
    if test < tol
      break
    end  
  end
  return (mu, v)
end

"""Approximates the dominant eigenvector of A."""
function power_method(A::Matrix{T}) where T <: Real
  v = randn(size(A, 1));
  for i = 1:100 
    v = A * v
    v = v / norm(v)
  end
  return v
end

