module MCMCHardcoreTest

using AlgorithmsFromTheBook, StatsBase, Test

@testset "MCMC hardcore" begin
(m, n, trials) = (50, 50, 1000000);
grid = falses(m, n);
sites_occupied = mcmc_hardcore(grid, trials);
describe(sites_occupied[10000:trials])
end

end