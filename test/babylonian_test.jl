module BabylonianTest

using AlgorithmsFromTheBook, Test

@testset "Babylonian" begin
root = babylonian(pi^2, 1e-10)
@test root ≈ 3.141592653589793
end

end