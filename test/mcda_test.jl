module McdaTest

# using AlgorithmsFromTheBook, DecisionTree, SparseArrays, Test, RDatasets, Statistics, LinearAlgebra

using LinearAlgebra, SparseArrays, RDatasets, Statistics, AlgorithmsFromTheBook, Test

@testset "MCDA" begin
"""Prepares Fisher's Iris data for analysis."""
function analyze_iris_data(epsilon::T, missing_rate::T,
  classes::Int) where T <: Real
#
  iris = dataset("datasets", "iris") # R dataset
  M = Tables.matrix(iris[:, 1:4]) # feature matrix
  label = iris[:, 5]
  cases = size(M, 1)
  class = zeros(Int, cases)
  for i = 1:cases
    if label[i] == "setosa"
      class[i] = 1
    elseif label[i] == "versicolor"
      class[i] = 2
    elseif label[i] == "virginica"
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
  for r = 1:6 # run MCDA for various ranks
    imputedclass = mcda(M, deletedclass, classes, r, epsilon);
    errors = count(class .- imputedclass != 0);
    println("rank = ",r," training errors  = ", errors)
  end
  return nothing
end

(classes, epsilon, missing_rate) = (3, 1e-5, 0.25);
analyze_iris_data(epsilon, missing_rate, classes)

end

end