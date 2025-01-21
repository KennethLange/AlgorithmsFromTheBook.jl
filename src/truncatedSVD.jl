export truncatedSVD1, truncatedSVD2

using Random, LinearAlgebra, Distances

"""Finds the best rank r approximation to the matrix X by alternating 
  least squares."""
function truncatedSVD1(X::Matrix{T}, r::Int, tol::T) where T <: Real
  (n, p) = size(X)
  FT = randn(T, r, n) # transposed factor matrix
  L = randn(T, r, p) # latent matrix
  G = zeros(T, r, r) # Gram matrix
  Lold = copy(L)
  for iteration = 1:500 # alternating least squares
    mul!(G, FT, transpose(FT)) # G = F' * F 
    mul!(L, FT, X) # V = F' * X
    ldiv!(cholesky!(G), L) # L = (F' * F) \ (F' * X)
    c = evaluate(Euclidean(), L, Lold) / (r * p)
    if c < tol  # convergence?
      break
    else
      Lold .= L 
    end
    mul!(G, L, transpose(L)) # G = L * L'
    mul!(FT, L, transpose(X)) # U = L * X'
    ldiv!(cholesky!(G), FT) # F' = (L * L') \ (L * X')
  end
  (Q1, R1) = qr!(transpose(FT)) # thin QR
  (Q2, R2) = qr!(transpose(L)) # thin QR
  (U, D, V) = svd!(R1 *  R2') # full SVD of r x r matrix
  return (Matrix(Q1) * U, D, Matrix(Q2) * V) # truncated svd
end

"""Finds the best rank r approximation to the matrix X by alternating 
  least squares."""
function truncatedSVD2(X::Matrix{T}, r::Int, tol::T) where T <: Real
  (n, p) = size(X)
  F = randn(T, n, r) # factor matrix
  LT = randn(T, p, r) # transposed latent matrix
  G = zeros(T, r, r) # Gram matrix
  LTold = copy(LT)
  for iteration = 1:500 # alternating least squares
    mul!(G, transpose(F), F) # G = F' * F 
    mul!(LT, transpose(X), F) # V = F' * X
    rdiv!(LT, cholesky!(G)) # L = (F' * F) \ (F' * X)
    c = evaluate(Euclidean(), LT, LTold) / (r * p)
    if c < tol  # convergence?
      break
    else
      LTold .= LT
    end
    mul!(G, transpose(LT), LT) # G = L * L'
    mul!(F, X, LT) # U = L * X'
    rdiv!(F, cholesky!(G))
  end
  (Q1, R1) = qr!(F) # thin QR
  (Q2, R2) = qr!(LT) # thin QR
  mul!(G, R1, R2')
  (U, D, V) = svd!(G) # full SVD of r x r matrix
  return (Matrix(Q1) * U, D, Matrix(Q2) * V) # truncated svd
end

