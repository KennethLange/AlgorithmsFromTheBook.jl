using LinearAlgebra
export nmf_pg, nmf_mm

"""Projects the point y onto the nonengative orthant."""
function proj_orthant(y::Array{T}) where T <: Real
   return max.(y, zero(T))
end

"""Performs nonnegative matrix factorization by a projected 
gradient algorithm."""
function nmf_pg(Y::Matrix{T}, r::Int, epsilon::T) where T <: Real
  (m, n) = size(Y)
  (maxiters, tol) = (500, 1e-6)
  U = rand(m, r)
  V = rand(r, n)
  for iteration = 1:maxiters
    gradV = U' * (U * V) - U' * Y + epsilon * V
    c = one(T) / norm(U)^2
    V = proj_orthant(V - c * gradV)
    gradU = (U * V) * V' - Y * V' + epsilon * U
    c = one(T) / norm(V)^2
    U = proj_orthant(U - c * gradU)
  end
  return (U, V)
end

"""Performs nonnegative matrix factorization by a multiplicative
MM algorithm."""
function nmf_mm(Y::Matrix{T}, r::Int) where T <: Real
  (m, n) = size(Y)
  (maxiters, tol) = (500, 1e-6)
  U = rand(m, r)
  V = rand(r, n)
  for iteration = 1:maxiters
    B = U * V
    YVT = Y * V'
    BVT = B * V'
    U = U .* (YVT ./ BVT)
    B = U * V
    UTY = U' * Y
    UTB = U' * B
    V = V .* (UTY ./ UTB)
    if mod(iteration, 20) == 0
      c = norm(U)
      U = U / c
      V = c * V
    end
  end
  return (U, V)
end
