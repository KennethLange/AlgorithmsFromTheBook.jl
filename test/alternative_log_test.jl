module AlternativeLogTest

using AlgorithmsFromTheBook, Distances, Random, Test

@testset "alternative_log" begin
Random.seed!(123)
x = log_base_e(exp(2.5)) 
@test x ≈ 2.499999999318811
end

end