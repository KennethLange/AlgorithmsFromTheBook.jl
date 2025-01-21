export DN

struct DN # dual number
  v # function value
  d # differential
end

Base.:+(a::DN, b::DN) = DN(a.v + b.v, a.d + b.d)
Base.:+(a::DN, b::Number) = DN(a.v + b, a.d) # addition
Base.:+(a::Number, b::DN) = DN(a + b.v, b.d)
Base.:-(a::DN, b::DN) = DN(a.v - b.v, a.d - b.d)
Base.:-(a::DN, b::Number) = DN(a.v - b, a.d) # subtraction
Base.:-(a::Number, b::DN) = DN(a - b.v, -b.d)
Base.:-(a::DN) = DN(-a.v, -a.d) # negation
Base.:*(a::DN, b::DN) = DN(a.v * b.v, a.d * b.v + a.v * b.d) 
Base.:*(a::DN, b::Number) = DN(a.v * b, a.d * b) # multiplication
Base.:*(a::Number, b::DN) = DN(a * b.v, a * b.d)
Base.:/(a::DN, b::DN) = DN(a.v / b.v, a.d / b.v - (a.v * b.d) / b.v^2)
Base.:/(a::DN, b::Number) = DN(a.v / b, a.d / b) # division
Base.:/(a::Number, b::DN) = DN(a / b.v, - (a * b.d) / b.v^2)
Base.:^(a::DN, b::Number) = DN(a.v^b, b * a.v^(b - 1) * a.d) # powers
Base.exp(d::DN) = DN(exp(d.v), exp(d.v) * d.d) # exponential
Base.log(d::DN) = DN(log(d.v), d.d / d.v) # logarithm
Base.sin(d::DN) = DN(sin(d.v), cos(d.v) * d.d) # sine
Base.cos(d::DN) = DN(cos(d.v), -sin(d.v) * d.d) # cosine
Base.tanh(d::DN) = DN(tanh(d.v), (1 - tanh(d.v))^2 * d.d) # hyperbolic tangent

function logistic(d::DN)
  sigma = 1 / (1 + exp(-d.v))
  dsigma = sigma * (1 - sigma)
  return DN(sigma, dsigma * d.d) 
end

function sq(d::DN)
  return DN(d.v^2, 2d.v * d.d)
end

function relu(d::DN) # smooth max{x, 0}
  s = sqrt(d.v^2 + 1.0e-6)
  return DN((d.v + s) / 2, ((1 + d.v / s) / 2) * d.d)
end

