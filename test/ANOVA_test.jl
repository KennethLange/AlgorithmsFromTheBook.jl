module AnovaTest

using AlgorithmsFromTheBook, LinearAlgebra, Test

@testset "ANOVA" begin
Y = zeros(3, 2, 4);
Y[:, :, 1] = [1 2; 3 4; 5 6];
Y[:, :, 2] = -Y[:, :, 1];
Y[:, :, 3] = Y[:, :, 1] / 2; 
Y[:, :, 4] = -Y[:,:,1] / 2; 
W = ones(size(Y));
W[1, 1, 1] = 0.0;
W[3, 2, 4] = 0.0;
(mu, alpha, beta) = MM_ANOVA(Y, W);
@test mu ≈ 0.0952380945
@test norm(alpha - [-0.26817; -0.0952381; 0.363408]) < 1e-6
@test norm(beta - [-0.210526 0.210526]) < 1e-6
end

end