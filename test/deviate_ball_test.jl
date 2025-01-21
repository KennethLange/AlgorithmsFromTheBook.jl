module DeviateBall

using LinearAlgebra, Test, AlgorithmsFromTheBook, Random

@testset "deviate ball" begin
  Random.seed!(123)
  n = 3;
  (center, radius, replicates) = (ones(n), 2.0, 1);
  y = ball_deviate(center, radius, replicates);
@test y ≈ reshape([0.6737147839569348; 0.2606247265125935; 0.17959929459323964], 3, 1)

end

end
