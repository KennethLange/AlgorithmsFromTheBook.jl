module FastlogTest

using AlgorithmsFromTheBook, Test

@testset "fast log" begin
@test fastlog(1e20 * pi) ≈ log(1e20 * pi)
end

end