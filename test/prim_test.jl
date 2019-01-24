module PrimTest

using AlgorithmsFromTheBook, Test

@testset "prim" begin
A = [0. 2 0 6 0; 2 0 3 8 5; 0 3 0 0 7; 6 8 0 0 9; 0 5 7 9 0];
(neighbor, weight) = adjacency_to_neighborhood(A);
mst = prim(neighbor, weight, 1)
@test all(mst .== [(1, 2), (2, 3), (2, 5), (1, 4)])
end

end