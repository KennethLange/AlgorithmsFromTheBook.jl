export discrete_deviate

"""Generates n random deviates according a given mass distribution."""
function discrete_deviate(mass::Vector{T}, n::Int) where T <: Real
  categories = length(mass)
  prob = mass / sum(mass)
  x = zeros(T, n)
  for trial = 1:n
    u = rand(T)
    s = zero(T)
    for i = 1:categories
      s = s + prob[i]
      if u <= s
        x[trial] = i
        break
      end
    end
  end
  return x
end

