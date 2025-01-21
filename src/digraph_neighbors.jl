export neighborhoods

"""Collects incoming and outgoing neighborhoods from an adjacency 
matrix A."""
function neighborhoods(A::AbstractMatrix)
#
  (nodes, T) = (size(A, 1), eltype(A))
  incoming = [Vector{Int}() for i = 1:nodes]
  outgoing = [Vector{Int}() for i = 1:nodes]
  for i = 1:nodes
    for j = 1:nodes
      if A[i, j] != zero(T)
        push!(incoming[j], i)
        push!(outgoing[i], j)
      end
    end
  end
  return (incoming, outgoing)
end
