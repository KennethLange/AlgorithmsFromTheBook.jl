module AnovaTest

using AlgorithmsFromTheBook, LinearAlgebra, Test

@testset "ANOVA" begin
Y = zeros(3, 2, 4);
Y[:, :, 1] = [1 2; 3 4; 5 6];
Y[:, :, 2] = -Y[:, :, 1];
Y[:, :, 3] = Y[:, :, 1] / 2; 
Y[:, :, 4] = -Y[:,:,1] / 2; 
W = trues(size(Y));
W[1, 1, 1] = false;
W[3, 2, 4] = false;
(mu, alpha, beta) = MM_ANOVA(Y, W);
@test mu ≈ 0.09375
@test norm(alpha - [-0.2552083333333333; -0.09375000000000001; 0.34895833333333337;;;]) < 1e-6
@test norm(beta - [-0.2013888888888889 0.2013888888888889;;;]) < 1e-6
end

end