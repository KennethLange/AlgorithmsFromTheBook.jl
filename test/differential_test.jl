module DifferentialTest

using Test, AlgorithmsFromTheBook



@testset "differential" begin
  (p, h) = (complex([1.5]), 1.0e-10);
  (fvalue, df) = differential(g, p, h);
@test df ≈ [3.622033700716326;;]
  
end

end

