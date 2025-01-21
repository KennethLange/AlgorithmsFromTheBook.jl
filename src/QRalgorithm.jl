export QRorchestrate
using LinearAlgebra

"""Implements one stage of a shifted QR algorithm."""
function QRalgorithm(A::Matrix{T}) where T <: Real
  m = size(A, 1)
  Anorm = norm(A)
  R = Matrix{T}(I, m, m) # identity matrix
  while norm(A[m, 1:m - 1]) > eps(T) * Anorm 
    mu = A[m, m] # Rayleigh quotient  
    F = qr(A - mu * I) # QR decomposition of A - mu * I  
    A = F.R * F.Q + mu * I # R * Q + mu * I
    R = R * F.Q
  end 
  return (A[m, m], R, A[1:m - 1, 1:m - 1],  A[1:m - 1, m])
end

"""Orchestrates the QR algorithm for extracting the eigenstructure of
the symmetric matrix A."""
function QRorchestrate(A::Matrix{T}) where T <: Real
  m = size(A, 1)
  D = zeros(T, m, m) # ultimate eigenvalues along diagonal
  E = Matrix{T}(I, m, m) # ultimate eigenvectors
  for k in reverse(1:m)
    (mu, R, A, w) = QRalgorithm(A) # note that A is overwritten
    E[:, 1:k] = E[:, 1:k] * R
    D[1:k, k + 1:m] = R' * D[1:k, k + 1:m]
    D[1:k, k] = [w; mu]
  end 
  return (E, D) 
end
