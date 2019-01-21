module ConnectTest

using AlgorithmsFromTheBook, Test

@testset "connect" begin
A = [[ 0 1 1 0 0 0 0]; [ 1 0 1 0 0 0 0]; [ 1 1 0 0 0 0 0];
[ 0 0 0 0 1 1 0]; [ 0 0 0 1 0 1 0]; [ 0 0 0 1 1 0 0];
[ 0 0 0 0 0 0 0]]; 
(neighbor, weight) = adjacency_to_neighborhood(A);
(component, components) = connect(neighbor)
@test all(component .== [1, 1, 1, 2, 2, 2, 3])
@test components == 3
end

end