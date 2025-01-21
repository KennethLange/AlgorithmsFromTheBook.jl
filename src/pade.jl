# export horner, LUdecomposition, LUsolve, pade_coefficients, pade_approximation
export horner, pade_coefficients, pade_approximation


using LinearAlgebra, Plots

"""Evaluates the polynomial p by Horner's method."""
function horner(p::Vector, x)
  pv = p[end]
  for i = (length(p) - 1):-1:1
    pv = x * pv + p[i]
  end
  return pv 
end

"""Overwrites the LU decomposition of A in A. Partial pivoting
is performed to enhance numerical stability."""
function LUdecomposition(A::Matrix{T}) where T <: Real
  n = size(A, 1)
  perm = collect(1:n) # identity permutation
  for k = 1:(n - 1)
    kp = argmax(abs.(A[k:n, k])) + k - 1 # find pivot row
    (perm[k], perm[kp]) = (perm[kp], perm[k]) # revise permutation
    for j = 1:n # interchange rows
      (A[k, j], A[kp, j]) = (A[kp, j], A[k, j])  
    end
    for i = (k + 1):n # compute multipliers
      A[i, k] = A[i, k] / A[k, k]
    end
    for j = (k + 1):n # adjust rows
      for i = (k + 1):n
        A[i, j] = A[i, j] - A[i, k] * A[k, j]
      end
    end
  end
  return (A, perm)
end

"""Solves the equation A*x = b using the LU decomposition of A."""
function LUsolve(LU::Matrix{T}, perm::Vector{Int}, 
  b::Vector{T}) where T <: Real
  n = size(LU, 1)
  z = zeros(T, n)
  for i = 1:n # solve L*z = Perm * b
    z[i] = b[perm[i]]
    for j = 1:(i - 1)
      z[i] = z[i] - LU[i, j] * z[j]
    end
  end
  for i = n:-1:1 # solve U*x = z
    for j = i + 1:n
      z[i] = z[i] - LU[i, j] * z[j] # x overwrites z
    end
    z[i] = z[i] / LU[i, i]
  end
  return z
end

"""Retrieves the coefficients of the Pade numerator p and
denominator q for the truncated expansion a."""
function pade_coefficients(a::Vector, n::Int)
  (l, T) = (length(a), eltype(a))
  k = l - 1 # degree of truncated series 
  A = zeros(T, k, k)
  m = k - n # (m, n) degrees of Pade polynomials (p, q)
  for i = 1:n
    A[i:k, i] = a[1:k - i + 1]
  end
  A[1:m, n + 1: m + n] = -Diagonal(ones(T, m))
  b = -a[2:l] #  -a except for first entry
  (A, perm) = LUdecomposition(A) # LU decomposition of A
  c = LUsolve(A, perm, b) # solve A * c = b
  return ([one(T); c[1:n]], [a[1]; c[n + 1:m + n]])
end

"""Computes the Pade approximation with numerator p and
denominator q."""
function pade_approximation(p::Vector, q::Vector, x)
  pv = horner(p::Vector, x)
  qv = horner(q::Vector, x)
  return pv / qv
end

