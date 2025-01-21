module LongestIncreasingSubsequenceTest

using Test, AlgorithmsFromTheBook, Random


@testset "longest.inc.s" begin
    
  Random.seed!(123)
  x = [2, 6, 3, 4, 1, 2, 9, 5, 8];
  longest = lis(x)
  x = ['a', 'f', 'c', 'd', 'a', 'b', 'i', 'e', 'h'];
  longest = lis(x)
  # println(longest)
  
@test longest == ['a', 'c', 'd', 'e', 'h']

end
end