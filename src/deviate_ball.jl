export ball_deviate

using LinearAlgebra  

"""Generates uniform deviates from the given ball."""
function ball_deviate(center, radius, replicates)
  n = length(center)
  y = zeros(n, replicates)
  for j = 1:replicates
    (x, u) = (randn(n), rand())
    y[:, j] = center + (radius * u^(1 / n) / norm(x)) * x
  end
  return y
end
