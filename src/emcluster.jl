using Distances, Statistics, LinearAlgebra
export kmeans, emcluster

"""Performs EM cluster analysis. Assignment probabilities are
returned in the matrix assign. The data are stored in X, and
hard initial assignments enter in class."""
function emcluster(X::Matrix{T}, class::Vector{Int}, 
  tol::T) where T <: Real
#
  (features, points) = size(X) # initialize variables and arrays.
  classes = maximum(class)
  (prior, center) = (zeros(T, classes), zeros(T, features, classes))
  assign = zeros(T, points, classes)
  for point = 1:points
    assign[point, class[point]] = one(T)
  end
  covar = cov(X')
  old_loglikelihood = -Inf
  for iteration = 1:1000 # enter the EM loop.
    center = X * assign # update centers and priors
    for i = 1:classes
      prior[i] = sum(assign[:, i])
      center[:, i] = center[:, i] / prior[i]
      prior[i] = prior[i] / points
    end
    fill!(covar, zero(T)) # update the covariance matrix
    for point = 1:points
      for i = 1:classes
        residual = X[:, point] - center[:, i]
        covar = covar + assign[point, i] * residual * residual'
      end
    end
    covar = covar / points
    (inverse, lndet) = (inv(covar), logdet(covar))
    loglikelihood = zero(T) 
    for point = 1:points # update assignment probabilities
      for i = 1:classes
        residual = X[:, point] - center[:, i]
        quadratic = dot(residual, inverse * residual)
        assign[point, i] = prior[i] * exp(- (lndet + quadratic) / 2)
      end
      s = sum(assign[point, :]) # update the loglikelihood
      loglikelihood = loglikelihood + log(s)
      assign[point, :] = assign[point, :] / s
    end
    if loglikelihood < old_loglikelihood + tol # check convergence
      break
    end
    old_loglikelihood = loglikelihood
  end
  return assign
end
