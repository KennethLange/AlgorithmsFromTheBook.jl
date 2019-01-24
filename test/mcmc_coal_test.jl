module MCMCCoalTest

using AlgorithmsFromTheBook, StatsBase, Test

@testset "mcmc coal" begin
(alpha, beta, gamma, delta, trials) = (4.0, 1.0, 1.0, 2.0, 10000);
x = [4, 5, 4, 0, 1, 4, 3, 4, 0, 6, 3, 3, 4, 0, 2, 6,
  3, 3, 5, 4, 5, 3, 1, 4, 4, 1, 5, 5, 3, 4, 2, 5,
  2, 2, 3, 4, 2, 1, 3, 2, 2, 1, 1, 1, 1, 3, 0, 0,
  1, 0, 1, 1, 0, 0, 3, 1, 0, 3, 2, 2, 0, 1, 1, 1,
  0, 1, 0, 1, 0, 0, 0, 2, 1, 0, 0, 0, 1, 1, 0, 2,
  3, 3, 1, 1, 2, 1, 1, 1, 1, 2, 4, 2, 0, 0, 1, 4,
  0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1];
(lambda, mu, k) = mcmc_coal(x, alpha, beta, gamma, delta, trials);
describe(k .+ 1850)
end

end