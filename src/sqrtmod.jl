export sqrtmod

"""Finds x such that x^2 = a mod m."""
function sqrtmod(a::Integer, m::Integer)
  arem = rem(a, m)
  for i in 1:m
    if rem(i * i, m) == arem
      return i
    end
  end
  return -1
end

