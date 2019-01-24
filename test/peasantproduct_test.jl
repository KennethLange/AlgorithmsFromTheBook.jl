module PeasantProductTest

using AlgorithmsFromTheBook, Test

@testset "peasant prod" begin
@test peasantproduct(10, 33) == 330
end

end