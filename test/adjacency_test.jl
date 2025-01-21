module AdjacencyTest

using AlgorithmsFromTheBook, Distances, Random, Test

@testset "annealing" begin
A = [[ 0 1 1 0 0 0 0]; [ 1 0 1 0 0 0 0]; [ 1 1 0 0 0 0 0];
[ 0 0 0 0 1 1 0]; [ 0 0 0 1 0 1 0]; [ 0 0 0 1 1 0 0];
[ 0 0 0 0 0 0 0]]; 
(neighbor, weight) = adjacency_to_neighborhood(A);

@test neighbor == [[2, 3], [1, 3], [1, 2], [5, 6], [4, 6], [4, 5], []]
@test weight == [[1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1], []]
end

end