using Distances, Statistics, StatsBase
export knn

"""Performs k nearest neighbor classification with training data
Y. The classes should be numbered 1, 2,...""" 
function knn(X::Matrix{T}, Y::Matrix{T}, class::Vector{Int}, 
  k::Int) where T <: Real
#
  testing = size(X, 2)
  predicted_class = zeros(Int, testing)
  distance = pairwise(Euclidean(), Y, X)
  for i = 1:testing # find k nearest neighbors
    perm = partialsortperm(distance[:, i], 1:k)
    predicted_class[i] = mode(class[perm]) # most common class
  end
  return predicted_class
end
