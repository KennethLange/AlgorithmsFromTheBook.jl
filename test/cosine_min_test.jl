module CosineMinTest

using AlgorithmsFromTheBook, Test

@testset "cos min" begin
x = 2.0
(x, y) = cosine_min(x)
@test x ≈ π
@test y ≈ π
end

end