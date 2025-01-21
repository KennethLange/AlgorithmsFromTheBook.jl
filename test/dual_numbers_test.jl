module DualNumbersTest

using Test, AlgorithmsFromTheBook

@testset "dual numbers" begin
  x = DN(5.0, [1.0]);
  y = exp(log(x)) # equals x
  #
  x = [2.0 3.0];
  x1 = DN(x[1], [1.0 0.0]);
  x2 = DN(x[2], [0.0 1.0]);
  y = x1 * x2 / 2 + cos(x1) - sin(x2)
  dual_num = [x1.v * x2.v / 2 + cos(x1.v)- sin(x2.v),
    x2.v / 2 - sin(x1.v), x1.v / 2 - cos(x2.v)]
  # println(dual_num)
  
@test dual_num ≈ [2.44273315539299, 0.5907025731743183, 1.9899924966004454]
end

end