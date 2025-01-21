module TruncatedSVDTest

using Random, LinearAlgebra, Distances, Test, AlgorithmsFromTheBook


@testset "truncatedSVD" begin
    
  Random.seed!(123)
  (n, p, r, tol) = (256, 2048, 5, 1e-7);
  X = randn(n, p);
  (U1, D1, V1) = truncatedSVD1(X, r, tol);
  (U1, D1, V1) = truncatedSVD1(X, r, tol);
  n1 = norm(X - U1 * diagm(D1) * V1');
  (U2, D2, V2) = truncatedSVD2(X, r, tol);
  (U2, D2, V2) = truncatedSVD2(X, r, tol);
  n2 = norm(X - U2 * diagm(D2) * V2');
  (U, D, V) = svd(X);

@test n1 - n2 ≈ -5.654280357703101e-6

end
end