module BernouliTest

using AlgorithmsFromTheBook, Test, Random

@testset "bernouli" begin
  Random.seed!(123)
  p = 10;
  bern = bernouli(p); #1,-1/2,1/6,0,-1/30,0,1/42,...
@test bern ≈ [1, -1//2, 1//6, 0, -1//30, 0, 1//42, 0, -1//30, 0, 5//66] atol=1e-6
end

end
