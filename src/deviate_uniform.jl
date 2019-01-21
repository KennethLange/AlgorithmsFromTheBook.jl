export uniform_deviate

"""Generates uniform random deviates on the interval (0,1)."""
function uniform_deviate(seed::Vector{Int})
  multiplier = (40014, 40692)
  prime = (2147483563, 2147483399)
  seed[1] = mod(multiplier[1] * seed[1], prime[1])
  seed[2] = mod(multiplier[2] * seed[2], prime[2])
  u = seed ./ prime
  return mod(sum(u), 1)
end
