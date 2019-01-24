module PowerModTest

using AlgorithmsFromTheBook, Test

@testset "power mod" begin
@test AlgorithmsFromTheBook.powermod(2, 6, 5) == 4
end

end