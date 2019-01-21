module BinarySearchTest

using AlgorithmsFromTheBook, Test

@testset "binary search" begin
x = ['a', 'b', 'd', 'f', 'g'];
@test binary_search(x, 'f') == 4
x = [1, 2, 4, 7, 9];
@test binary_search(x, 3) == 0
end

end