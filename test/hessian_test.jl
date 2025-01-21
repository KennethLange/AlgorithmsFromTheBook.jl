module HessianTest

using Test, AlgorithmsFromTheBook


@testset "hessian" begin
    
  (x, d) = (complex([1.5]), 1.0e-4);
  d2f =  hessian(g, x, d);
  

@test d2f ≈ [14.56828426829029;;]
  
  
end

end