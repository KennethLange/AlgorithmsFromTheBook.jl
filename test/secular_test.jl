module SecularTest

using LinearAlgebra, Random, Test, AlgorithmsFromTheBook
@testset "secular" begin
    
  Random.seed!(123)
  (n, mu, tol) = (100, randn(), 1e-10);
  w = rand(n);
  d = sort(randn(n));
  (lambda, value) = solve_secular(d, w, mu, tol);
#     for i = 1:length(d)
#       println(i,"  ",lambda[i],"  ",value[i])
#     end

@test sum(lambda) ≈ -6.4797790898340795
@test sum(value) ≈ 2.124007615345036e-7

end

end