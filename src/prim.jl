using DataStructures
import DataStructures: PriorityQueue
export prim

"""Implements Prim's algorithm for finding a minimal
spanning tree of a graph."""
function prim(neighbor::Array{Array{Int, 1}, 1}, 
  weight::Array{Array{T, 1}, 1}, i::Int) where T <: Number
#
  nodes = length(neighbor)
  visited = falses(nodes)
  mst_nodes = 1
  key = Array{Tuple{Int, Int}, 1}(undef, 0) # define keys
  priority = Array{Float64, 1}(undef, 0) # define priorities
  pq = PriorityQueue(zip(key, priority)) # initialize queue
  mst = Array{Tuple{Int, Int}, 1}(undef, 0) # minimum spanning tree
  while mst_nodes < nodes
    if !visited[i]
      visited[i] = true
      for k = 1:length(neighbor[i])
        j = neighbor[i][k]
        pq[(i, j)] = weight[i][k]
      end
      ((k, l), val) = peek(pq) # choose smallest edge
      dequeue!(pq)
      if !visited[k]
        push!(mst, (k, l))
        mst_nodes = mst_nodes + 1
        i = k
      elseif !visited[l]
        push!(mst, (k, l))
        mst_nodes = mst_nodes + 1
        i = l
      end
    else
      ((k, l), val) = peek(pq) # choose smallest edge
      dequeue!(pq)
      if !visited[k]
        push!(mst, (k, l))
        mst_nodes = mst_nodes + 1
        i = k
      elseif !visited[l]
        push!(mst, (k, l))
        mst_nodes = mst_nodes + 1
        i = l
      end
    end
  end
  return mst
end

# """Collects neighborhoods and weights from an adjacency matrix A."""
# function adjacency_to_neighborhood(A::Matrix)
#   (nodes, T) = (size(A, 1), eltype(A))
#   neighbor = [Vector{Int}() for i = 1:nodes]
#   weight = [Vector{T}() for i = 1:nodes]
#   for i = 1:nodes
#     for j = 1:nodes
#       if A[i, j] != zero(T)
#         push!(neighbor[i], j)
#         push!(weight[i], A[i, j])
#       end
#     end
#   end
#   return (neighbor, weight)
# end
