using LinearAlgebra, SparseArrays
export revised_simplex, simplex_program

"""Minimizes c'x subject to Ax = b and x >= 0. B enters
with the indices of a feasible vertex. The linear program
is assumed to be nondegenerate.""" 
function revised_simplex(A::SparseMatrixCSC{T}, b::Vector{T}, 
  c::Vector{T}, B::Vector{Int}, tol::T) where T <: Real
  (m, n) = size(A)
  N = setdiff(collect(1:n), B)
  ABinv = inv(convert(Matrix{T}, A[:, B]))
  xB = ABinv * b
  for iteration = 1:10*m
    mu = c[N]' - (c[B]' * ABinv) * A[:, N]
    k = argmin(mu')
    if mu[k] > -tol # test for convergence
      return (dot(c[B], xB), B, xB)
    else
      d = ABinv * A[:, N[k]] # possible update directions
      p = findall(d .> tol)
      if isempty(p)
        return (-Inf, nothing, nothing) # unbounded below
      end
      (t, i) = findmin(xB[p] ./ d[p])
      (B[p[i]], N[k]) = (N[k], B[p[i]]) # revise vertex set
      xB = xB - t * d
      xB[p[i]] = t
      v = ABinv[p[i], :] / d[p[i]] # Sherman-Morrison update
      d[p[i]] = d[p[i]] - one(T)
      ABinv = ABinv - d * v'
    end
  end
end

"""Orchestrates the revised simplex method."""
function simplex_program(A::SparseMatrixCSC{T}, b::Vector{T}, 
  c::Vector{T}, tol::T) where T <: Real
  (m, n) = size(A)
  for i = 1:m
    if b[i] < zero(T)
      A[i, :] = - A[i, :]
      b[i] = - b[i]
    end
  end
  A1 = [A I]
  c1 = [zeros(T, n); ones(T, m)]
  B = collect(n + 1:m + n)
  (cost, B, xB) = revised_simplex(A1, b, c1, B, tol)
  if cost > tol
    return (Inf, nothing, nothing)
  else
    (cost, B, xB) = revised_simplex(A, b, c, B, tol)
    return (cost, B, xB)
  end
end
