export FloydWarshall


"""Finds the shortest distance between all node pairs in an
edge-weighted directed graph.""" 
function FloydWarshall(w::Matrix{T}) where T <: Number
  n = size(w, 1)
  dist = w
  for i = 1:n
    dist[i, i] = zero(T)
  end
  for k = 1:n
    for i = 1:n
      for j = 1:n
        if dist[i, j] > dist[i, k] + dist[k, j]
          dist[i, j] = dist[i, k] + dist[k, j]
        end
      end
    end
  end
  return dist
end

