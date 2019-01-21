using FFTW
export convolve, fftconvolve

"""Computes the convolution of the sequences a and b naively."""
function convolve(a::Vector{T}, b::Vector{T}) where T <: Real
  (m, n) = (length(a), length(b))
  c = zeros(T, m + n - 1)
  for j = 1:m
    for k = 1:n
      c[j + k - 1] = c[j + k - 1] + a[j] * b[k]
    end
  end
  return c
end

"""Computes the convolution of the sequences a and b by the fast
Fourier transform."""
function fftconvolve(a::Vector{T}, b::Vector{T}) where T <: Real
  (m, n) = (length(a), length(b))
   r = ceil(Int, log(2, max(m, n)))
   c = zeros(T, 2^(r + 1))
   c[1:m] = a
   d = zeros(T, 2^(r + 1))
   d[1:n] = b
   c = fft(c)
   d = fft(d) 
   return ifft(c .* d)
end
