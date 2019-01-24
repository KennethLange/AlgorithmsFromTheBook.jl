export perfectpower

# """Delivers all primes <= n."""
# function eratosthenes(n::Integer)
#   isprime = ones(Bool, n)
#   isprime[1] = false
#   for i = 2:round(Int, sqrt(n))
#     if isprime[i]
#       for j = i^2:i:n
#         isprime[j] = false
#       end
#     end
#   end
#   return filter(x -> isprime[x], 1:n)
# end

"""Determines whether n is a perfect power."""
function perfectpower(n::Integer)
  m = Int(floor(log(2, n))) # integer part of log base 2 of n
  prime_list = eratosthenes(m) 
  for j in prime_list
    k = Int(round(n^(1/j)))
    if isequal(k^j, n)
      return true
    end
  end
  return false
end


