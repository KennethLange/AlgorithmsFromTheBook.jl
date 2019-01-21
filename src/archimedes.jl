export archimedes

""" Computes pi."""
function archimedes(n::Integer)
  (a, b) = (4.0, 4.0 / sqrt(2.0))
  for i = 1:n
    a = 2 * a * b / (a + b)
    b = sqrt(a * b)
  end
  return (a, b)
end


