module PeasantMultiplicationTest

using AlgorithmsFromTheBook, Test

@testset "peasant multiplication" begin
    
  c = peasantproduct(10, 33)

@test c ≈ 330

end

end