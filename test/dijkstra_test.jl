module DijkstraTest

using AlgorithmsFromTheBook, Test

@testset "Dijkstra" begin
A = [[ 0 7 9 0 0 14]; [ 7 0 10 15 0 0]; [ 9 10 0 11 0 2];
[ 0 15 11 0 6 0]; [ 0 0 0 6 0 9]; [ 14 0 2 0 9 0]]; 
(neighbor, weight) = adjacency_to_neighborhood(A);
(distance, predecessor) = dijkstra(neighbor, weight, 1) 
@test all(distance .== [0.0, 7.0, 9.0, 20.0, 20.0, 11.0])
@test all(predecessor .== [0, 1, 1, 3, 6, 3])
end

end