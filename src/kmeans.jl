using Distances
export kmeans

"""Implements kmeans clustering. The variable class should enter
with an initial guess of the classifications."""
function kmeans(X::Matrix{T}, class::Vector{Int}, 
  k::Integer) where T <: Real
#
  (features, points) = size(X)
  (center, members) = (zeros(T, features, k), zeros(Int, k))
  switched = true
  while switched # iterate until memberships stabilize
    fill!(center, zero(T)) # update centers
    fill!(members, 0) 
    for point = 1:points 
      i = class[point]
      center[:, i] = center[:, i] + X[:, point]
      members[i] = members[i] + 1
    end
    for j = 1:k
      center[:, j] = center[:, j] / max(members[j], 1)
    end
    switched = false # update classes
    dist = pairwise(Euclidean(), center, X) # fetch distances
    for point = 1:points
      j = argmin(dist[:, point]) # closest center
      if class[point] != j
        class[point] = j
        switched = true
      end
    end
  end 
  return (class, center)
end
