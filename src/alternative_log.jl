# using Random
export log_base_e

"""Computes ln(y) by repeated square roots and a good expansion."""
function log_base_e(y)
  (c, d, z) = (1, log(2) * exponent(y), significand(y))
  while abs(z - 1) > 1 / 4 # repeated square roots
    c = 2c
    z = sqrt(z)
  end
  z = (z - 1) / (z + 1) # expand in power series in new variable
  u = z * z
  v = u * u
  return d + c * 2z * (1 + u / 3 + v / 5 + u * v / 7)
end
