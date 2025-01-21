module MergesortTest
 
using Test, Random, AlgorithmsFromTheBook

@testset "merge sort" begin
    
  Random.seed!(123)
  x = [5, 4, 3, 1, 2, 8, 7, 6];
  xsorted = mergesort(x)
  x = ['a', 'c', 'd', 'b', 'f', 'e', 'h', 'g'];
  xsorted = mergesort(x)

@test xsorted == ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
  
  
end

end