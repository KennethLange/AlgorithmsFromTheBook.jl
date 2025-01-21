module SqrtmodTest

using LinearAlgebra, Random, Test, AlgorithmsFromTheBook

@testset "sqrtmod" begin
    
  Random.seed!(123)
  x = sqrtmod(3, 7) # returns -1 no solution
  x = sqrtmod(2, 7) # returns 3
  x = sqrtmod(4, 8) # returns 2
  # println(x)

@test x ≈ 2

end
end