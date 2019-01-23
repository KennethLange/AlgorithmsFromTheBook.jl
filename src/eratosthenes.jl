export eratosthenes

"""Delivers all primes <= n."""
function eratosthenes(n::Integer)
  isprime = ones(Bool, n)
  isprime[1] = false
  for i = 2:round(Int, sqrt(n))
    if isprime[i]
      for j = i^2:i:n # all multiples of i < i^2 already composite
        isprime[j] = false
      end
    end
  end
  return filter(x -> isprime[x], 1:n)
end


