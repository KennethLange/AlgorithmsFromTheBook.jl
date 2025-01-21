export mds

using Distances, LinearAlgebra, Plots

"""Performs multidimensional scaling with dissimilarity matrix D,
weight matrix W, and n points in R^p.""" 
function mds(D::Matrix{T}, W::Matrix{T}, p::Int, tol::T) where T <: Real
#
  @assert sum(abs, diag(W)) == zero(T)
  (B, n, obj, old_obj) = (similar(D), size(D, 2), zero(T), zero(T)) 
  X = randn(T, p, n) # n random points in R^p
  Xnew = similar(X)
  V = Diagonal(vec(sum(W, dims=2))) - W
  pinvV = pinv(V) # pseudo-inverse of V
  for iter = 1:500
    Dist = pairwise(Euclidean(), X, dims=2)
    fill!(B, zero(T)) # Guttman matrix
    for i = 1:n
      for j = 1:(i - 1)
        c = W[i, j] * D[i, j] / Dist[i, j]
        B[i, i] = B[i, i] + c
        B[j, j] = B[j, j] + c
        B[i, j] = B[i, j] - c
        B[j, i] = B[j, i] - c
      end
    end
    Xnew =  X * B * pinvV # MM update
    obj = wsqeuclidean(vec(D), vec(Dist), vec(W)) / 2 # loss
    # println(iter,"  ",obj)
    if abs(obj - old_obj) < (one(T) + old_obj) * tol break end
    old_obj = obj
    X .= Xnew
  end
  return (obj, X)
end
