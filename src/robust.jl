export robust

using LinearAlgebra, Plots

"""Computes a weighted least squares estimate."""
function wls(X::Matrix{T}, w::Vector{T}, y::Vector{T}) where T <: Real
  return (Diagonal(sqrt.(w)) * X) \ (sqrt.(w) .* y)
end

"""Implements robust regression with predictors X and responses y."""
function robust(X::Matrix{T}, y::Vector{T}, c::T) where T <: Real
  (n, p) = size(X)
  (w, rsq, beta) = (ones(T, n), zeros(T, n), zeros(T, p))
  for i = 0:100
    beta = wls(X, w, y) # MM update
    rsq = (y - X * beta).^2 # squared residuals
    w = c ./ (c .+ rsq).^2 # weights
  end
  return beta
end



