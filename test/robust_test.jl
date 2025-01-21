module RobustTest

using LinearAlgebra, Plots, Random, Test, AlgorithmsFromTheBook

@testset "robust" begin
    
  Random.seed!(123)
  y = [228.,253.,230.,242.,213.,217.,248.,207.,228.,311.,
       110.,257.,233.,217.,237.,281.,233.,204.,194.,199.,
       220.,231,243.,14.]; 
  X = hcat(ones(length(y)), [142.,173.,130.,122.,111.,112.,99.,
       88.,130.,137.,48.,94.,97.,88.,91.,104.,100.,121.,
       97.,133.,115.,120.,224.,4.]);
  beta = robust(X, y, 2.0);
#     scatter(X[:, 2], y, legend = :none, xaxis="births", yaxis="deaths")
#     plot!(X[:, 2], X * beta); # robust least squares 
  ols_beta = X \ y; # ordinary least squares 
#     plot!(X[:, 2], X * beta)
#     savefig("Robust.pdf")
  # println(ols_beta)


@test ols_beta ≈ [114.95002479939066, 0.9295520167218746]

end
end
