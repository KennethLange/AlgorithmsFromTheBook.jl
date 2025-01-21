export cosine

function taylor_cosine(x)
  y = x * x
  return 1 - y / 2 + y * y / 24  # Taylor expansion
end

function cosine(x)
  y = mod(x, 2pi)
  k = 0
  while y > 1 / 32
    k = k + 1
    y = y / 2
  end
  c = taylor_cosine(y)
  for j = 1:k
     c = 2c^2 - 1
  end
  return c
end


