export run_example

using LinearAlgebra, RDatasets, Statistics, StatsBase

"""Implements steepest descent in the SVM model."""
function steepest(X::Matrix{T}, y::Vector{T}, rho::T, 
  tol::T) where T <: Float64
#
  (m, n) = size(X)
  (obj, old, iters) = (zero(T), zero(T), 0)
  (b, grad, increment) = (randn(T, n), zeros(T, n), zeros(T, n))
  a = zeros(T, m) # work vector
  Xb = zeros(T, m) # work vector
  mul!(Xb, X, b) # Xb = X * b
  for iter = 1:1000
    iters = iters + 1
    grad .= rho * b # gradient of penalty
    grad[n] = zero(T)
    for i = 1:m
     a[i] = - y[i] * max(one(T) - y[i] * Xb[i], zero(T))
    end
    grad = transpose(X) * a + grad # gradient of objective
    s = norm(grad)^2 # optimal step size
    mul!(Xb, X, grad)
    t = norm(Xb)^2
    s = s / (t + rho * (norm(grad)^2 - grad[n]^2))
    b .= b - s * grad # steepest descent update
    obj = rho *(norm(b)^2 - b[n]^2) # update objective
    mul!(Xb, X, b) # Xb = X * b 
    for i = 1:m
      obj = obj + max(one(T) - y[i] * Xb[i], zero(T))^2
    end
    if norm(grad) < tol # convergence test
      break
    else
      old = obj
    end  
  end
  return b
end

"""Loads Fisher's iris data from R."""
function load_data()
  iris = dataset("datasets", "iris") # R dataset
  (cases, labels) = size(iris)
  X = Tables.matrix( iris[:, 1:4]) # feature matrix
  y = zeros(cases) # class indicator
  for i = 1:cases
    if iris[i, 5] == "setosa"
      y[i] = 1.0
    else
      y[i] = -1.0
    end
  end
  return (X, y)
end

"""Coordinates analysis of SVM classification."""
function run_example(rho, tol)
  (X, y) = load_data()
  (cases, features) = size(X)
  X = [X ones(cases)] # add a feature for the intercept
  (avg, stdev) = (zeros(features), zeros(features))
  for j = 1:features # standardize features except intercept
    (avg[j], stdev[j]) = mean_and_std(X[:, j]; corrected = true)
    @. X[:, j] = (X[:, j] - avg[j]) / stdev[j]
  end
  b = steepest(X, y, rho, tol) # steepest descent estimates
  errors = 0 # training errors
  for i = 1:cases
    if sign(dot(X[i, :], b)) != y[i] errors = errors + 1 end
  end
  return (errors, avg, stdev, b)
end
