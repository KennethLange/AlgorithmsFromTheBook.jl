module Cosine

using Test, AlgorithmsFromTheBook

@testset "cosine" begin
  m = 0.0
  n = 100
  for i = 0:n
    x = (i / n) * 2pi
    m = max(m, abs(cos(x)- cosine(x)))
  end
@test m ≈ 3.666087544651475e-9
end
  
end


