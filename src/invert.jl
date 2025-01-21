export invert

using FFTW

"""Inverts a Fourier transform on the real line by the FFT."""
function invert(transform, d::Int, a::T) where T <: Real
  (n, m) = (2^d, 2^(d - 1))
  fhat = zeros(T, n)
  for k = 1:n
    fhat[k] = transform((k - 1 - m) / a) / a
    if iseven(k)
      fhat[k] = - fhat[k]
    end 
  end
  f = n * ifft(fhat) # Julia puts 1/n in front of inverse
  for j = 1:n
    if iseven(j)
      f[j] = - f[j]
    end
  end
  return f
end
