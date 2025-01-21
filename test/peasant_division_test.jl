module PeasantDivisionTest

using Test, AlgorithmsFromTheBook


@testset "pade" begin
    
  (m, n) = (4508, 13);
  (q, r) = peasant_divrem(m, n);
  # println(q,"  ", r,"  ",n * q + r)

@test n * q + r ≈ 4508

end
  
end