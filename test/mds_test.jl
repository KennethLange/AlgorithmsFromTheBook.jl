module MdsTest

using Distances, LinearAlgebra, Plots, Random, AlgorithmsFromTheBook, Test


@testset "multiD scaling" begin
    
  Random.seed!(123)

  D = [[0.0 587 1212 701 1936 604 748 2139 2182 543];
  [587 0 920 940 1745 1188 713 1858 1737 597];
  [1212 920 0 879 831 1726 1631 949 1021 1494];
  [701 940 879 0 1374 968 1420 1645 1891 1220];
  [1936 1745 831 1374 0 2339 2451 347 959 2300];
  [604 1188 1726 968 2339 0 1092 2594 2734 923];
  [748 713 1631 1420 2451 1092 0 2571 2408 205];
  [2139 1858 949 1645 347 2594 2571 0 678 2442];
  [2182 1737 1021 1891 959 2734 2408 678 0 2329];
  [543 597 1494 1220 2300 923 205 2442 2329 0]];
  city = ["atl" "chi" "den" "hou" "la" "mi" "ny" "sf" "sea" "dc"]
  W = ones(size(D,1), size(D, 2)) - I; # uniform weights
  (p, tol) = (2, 1.0e-5); # p = dimension of scaling space

  (best, location) = (Inf, zeros(p, size(D, 1)));

  for i = 1:10 # multiple tries
    (obj, X) = mdscaling(D, W, p, tol)
    if obj < best
      best = obj
      location = X
    end
  end
  # scatter(location[1, :], location[2, :], legend = false)
  # savefig("MDS.pdf")
  
@test location ≈ [0.0 0.0 -890.3329971654864 -701.8457645458611 -1716.443175577514 92.96213069771649 666.6295454276907 -1738.1469309946426 -1288.506834177725 486.1658910867809; 0.0 588.8476301022753 820.796198817031 -37.063065166752985 895.8986178360163 -594.7515164458877 338.5869814237798 1244.4673706430465 1757.1362214146538 241.80094172569835]
  
end

end