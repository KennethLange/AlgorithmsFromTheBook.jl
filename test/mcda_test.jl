module McdaTest

using AlgorithmsFromTheBook, DecisionTree, SparseArrays, Test

@testset "MCDA" begin
"""Prepares Fisher's Iris data for analysis."""
function analyze_iris_data(epsilon::T, missing_rate::T,
  classes::Int) where T <: Real
#
  (features, labels) = load_data("iris")  # data input Array{Any}
  M = float.(features)
  label = string.(labels)
  cases = size(M, 1)
  class = zeros(Int, cases)
  for i = 1:cases
    if label[i] == "Iris-setosa"
      class[i] = 1
    elseif label[i] == "Iris-versicolor"
      class[i] = 2
    elseif label[i] == "Iris-virginica"
      class[i] = 3
    else
      println("failed label")
    end
  end
  for i in eachindex(M) # randomly delete features
    if rand() < missing_rate
      M[i] = 0.0
    end
  end
  M = sparse(M)
  deletedclass = copy(class)
  for i = 1:cases # randomly delete classes
    if rand() < missing_rate
      deletedclass[i] = 0
    end
  end
  for r = 1:6 # run MCDA
    imputedclass = mcda(M, deletedclass, classes, r, epsilon);
    errors = count(class - imputedclass != 0);
    println("rank = ", r," classification_errors = ", errors)
  end
  return nothing
end

(classes, epsilon, missing_rate) = (3, 1e-5, 0.25);
analyze_iris_data(epsilon, missing_rate, classes) 
end

end