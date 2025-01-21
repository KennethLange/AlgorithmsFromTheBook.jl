export log_base_e

function log_base_e(y)
  log2 = 0.6931471805599453
  (c, d, z) = (1, log2 * exponent(y), significand(y))
  while abs(z - 1) > 1 / 4 # repeated square roots
    c = 2c
    z = sqrt(z)
  end
  z = (z - 1) / (z + 1) # expand in power series
  u = z * z
  v = u * u
  return d + c * 2z * (1 + u / 3 + v / 5 + u * v / 7)
end


