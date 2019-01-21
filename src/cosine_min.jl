export cosine_min

"""Minimizes cos(x) by an MM algorithm and Newwton's method."""
function cosine_min(x)
  y = copy(x)
  for n = 0:6
    println(n,"  ",x,"  ",y)
    x = x + sin(x)  # MM update
    y = y - sin(y) / cos(y) # Newton update
  end
  return (x, y)
end
