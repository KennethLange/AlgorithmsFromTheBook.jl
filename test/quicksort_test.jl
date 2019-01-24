module QuicksortTest

using AlgorithmsFromTheBook, Test

@testset "quick sort" begin
x = [5, 4, 3, 1, 2, 8, 7, 6, -1];
quicksort(x)
println(x)
@test all(x .== [-1, 1, 2, 3, 4, 5, 6, 7, 8])
x = ['a', 'c', 'd', 'b', 'f', 'e', 'h', 'g', 'y'];
quicksort(x)
println(x)
@test all(x .== ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'y'])
end

end