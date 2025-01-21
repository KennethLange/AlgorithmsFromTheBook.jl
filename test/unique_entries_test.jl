module UniqueEntriesTest

using Test, AlgorithmsFromTheBook, Random

@testset "unique entries" begin
    
  Random.seed!(123)
  x = ['c', 'b', 'd', 'a', 'c', 'a', 'b'];
  y = unique_entries(x);
  x = [7, 1, 3, 2, 5, 6, 2, 5];
  y = unique_entries(x);

@test y ≈ [1, 2, 3, 5, 6, 7]

end

end