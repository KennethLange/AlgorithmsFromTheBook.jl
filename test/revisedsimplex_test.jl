module RevisedSimplexTest

using AlgorithmsFromTheBook, SparseArrays, Test

@testset "revised simplex" begin
# c = [-3.0; -2; 0; 0; 0]; # Wikipedia example
# A = [ 1.0 1 1 0 0; 2 1 0 1 0; 1 0 0 0 1 ];
# b = [ 40.0; 60; 30];
c = [-2.0; -3; -4; 0; 0]; # Wikipedia example
A = [ 3.0 2 1 1 0; 2 5 3 0 1 ];
b = [ 10.0; 15 ];
A = sparse(A);
tol = 1e-5;
(cost, B, xB) = simplex_program(A, b, c, tol)
@test cost ≈ -20.0
@test all(B .≈ [4, 3])
@test all(xB .≈ [5.0, 5.0])
end

end