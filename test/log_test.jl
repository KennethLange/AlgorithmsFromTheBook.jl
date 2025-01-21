module LogTest
  
using Test, AlgorithmsFromTheBook

@testset "log" begin

@test log_base_e(exp(2.5)) ≈ 2.499999999318811

end

end