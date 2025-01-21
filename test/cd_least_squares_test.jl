module CdLeastSquaresTest

using AlgorithmsFromTheBook, Test, Random, LinearAlgebra

@testset "cd_least_squares" begin
    
  Random.seed!(123)
  (n, p, tol) = (100, 50, 1.0e-5);
  (A, b) = (randn(n, p), rand(n));
  (l, u) = (zeros(p), zeros(p));
  u .= Inf; # nonnegative least squares
#     @time x = coord_descent_least_squares(A, b, l, u, tol);
  x = coord_descent_least_squares(A, b, l, u, tol);
  
@test  x ≈ [0.012537249286880435, 0.0, 0.03385657804226148, 0.0, 0.0, 0.0, 0.0, 0.027616943757231564, 0.0, 0.0, 0.033307218090191326, 0.0, 0.09476102230223582, 0.0, 0.0, 0.0, 0.0, 0.0, 0.033492387020350366, 0.0059014017321184, 0.02204614417679239, 0.0, 0.0, 0.0, 0.0, 0.0, 0.04995020842717618, 0.0, 0.0, 0.0, 0.07260314540358774, 0.008871651642248192, 0.0, 0.07231740867025631, 0.0, 0.0, 0.0, 0.027404861095126284, 0.06555012890470578, 0.014163772169420696, 0.06425718815786674, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

end
end

