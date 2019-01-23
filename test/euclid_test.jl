module EuclidTest

using AlgorithmsFromTheBook, Test

@testset "Euclid" begin
@test euclid(600, 220) == gcd(600, 220)
end

end