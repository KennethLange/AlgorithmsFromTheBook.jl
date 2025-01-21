export bernouli

"""Computes the next row of Pascal's triangle."""
function pascal!(binom::Vector{Int}, n)
  for k = n:-1:2
    binom[k] = binom[k - 1] + binom[k]
  end
end

"""Computes the Bernoulli numbers B_0,..,B_p."""
function bernouli(p::Int)
  binom = ones(Int, p + 1)
  bern = ones(Rational, p + 1)
  println(binom[1:1])
  for n = 1:p
    pascal!(binom, n + 1)
    println(binom[1:n + 1]) # prints Pascal's triangle
    s = zero(Rational)
    for k = 1:n
      s = s + binom[k] * bern[k]
    end
    bern[n + 1] = - s / (n + 1)
  end
  return bern
end


