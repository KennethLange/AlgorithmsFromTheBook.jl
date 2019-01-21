module ArchimedesTest

using AlgorithmsFromTheBook, Test

@testset "Archimedes" begin
(upper, lower) = archimedes(20)
@test upper ≈ 3.1415926535903798
@test lower ≈ 3.1415926535894987
end

end