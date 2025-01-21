module BucketsortTest

using AlgorithmsFromTheBook, Test, Random



@testset "bucketsort" begin
  Random.seed!(123)
  (n, buckets) = (8, 3);
  x = rand(n) # random uniform deviates
  xsorted = bucketsort(x, buckets)
@test xsorted ≈  [0.2538490889415096,
                  0.33415153638191886,
                  0.4273278808735992,
                  0.44349373245960455,
                  0.5120830400366143,
                  0.7456733811393941,
                  0.867547200255958,
                  0.906299638797481]
end

end


