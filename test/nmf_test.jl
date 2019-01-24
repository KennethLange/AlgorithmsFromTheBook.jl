module NMFTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "NMF" begin
Random.seed!(123)
"""Compares a projected gradient algorithm and MM algorithm."""
function compare(m::Int, n::Int, r::Int)
  U = rand(m, r);
  V = rand(r, n);
  Y = U * V;
  epsilon = 0.0;
  for k = 1:r
    @time (U, V) = nmf_pg(Y, k, epsilon);
    println("rank = ",k," pg loss = ",norm(Y - U * V))
    @time (U, V) = nmf_mm(Y, k); 
    println("rank = ",k," mm loss = ",norm(Y - U * V))
  end
end

(m, n, r) = (200, 100, 10);
compare(m, n, r)
end

end