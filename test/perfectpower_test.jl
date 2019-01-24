module PerfectPowerTest

using AlgorithmsFromTheBook, Test

@testset "perfect power" begin
@test perfectpower(1000) == true
end

end