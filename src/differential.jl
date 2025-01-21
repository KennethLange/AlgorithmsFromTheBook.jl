export differential, g


"""Finds the differential of the function f at p."""
function differential(f::Function, p, h)
  fvalue = real(f(p)) # function value
  df = zeros(length(fvalue), 0) # empty differential
  for i = 1:length(p)
    p[i] = p[i] + h * im # perturb parameter
    fi = f(p) # compute perturbed function value
    p[i] = complex(real(p[i]), 0.0) # reset parameter
    df  = [df imag(fi) ./ h] # concatenate ith partial
  end
  return (fvalue, df) # return the differential
end

function g(p)
  return exp(p[1]) / (sin(p[1])^3 + cos(p[1])^3)
end


