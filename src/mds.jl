export mdscaling

using Distances, LinearAlgebra, Random

"""Performs multidimensional scaling with dissimilarity matrix D,
weight matrix W, and points in R^p.""" 
function mdscaling(D::Matrix{T}, W::Matrix{T}, p::Int, 
  tol::T) where T <: Real
  @assert sum(abs, diag(W)) == zero(T)
  (V, q, obj, obj_new) = (similar(D), size(D, 2), zero(T), zero(T)) 
  X = randn(T, p, q) # q random points in R^p
  X[:, 1:2] .= zero(T)
  X[end, 2] = rand(T)
  Xnew = similar(X)
  Wsum = Diagonal(vec(sum(W, dims=2))) # diagonal matrix of row sums
  for iter = 1:5000
    Dist = pairwise(Euclidean(), X, dims=2)
    @. V = (W * D) / (Dist + eps(T))
    Vsum = Diagonal(vec(sum(V, dims=2)))
    Xnew = (X * (W - V) + X * (Vsum + Wsum)) * inv(2 * Wsum)
    obj_new = wsqeuclidean(vec(D), vec(Dist), vec(W)) / 2
    if abs(obj - obj_new) < (one(T) + obj) * tol break end
    obj = obj_new
    X .= Xnew
    X[:, 1] .= zero(T)
    X[1:end - 1, 2] .= zero(T)
  end
  return (obj, X)
end
