module LongestCommonSubsequenceTest

using AlgorithmsFromTheBook, Test, Random

@testset "LongestCommonSubsequence" begin
    
  Random.seed!(123)
  x = split("AGGTAB", "");
  y = split("GXTXAYB", "");
  l = lcs(x, y, length(x), length(y))
  println(l)
  
@test l ≈ 4

end
end