using LinearAlgebra, SparseArrays
export mcda

"""Performs matrix completion discriminant analysis. M is the sparse
predictor matrix. Missing entries of class are coded as 0."""
function mcda(M::SparseMatrixCSC{T, Int}, class::Vector{Int}, 
  classes::Int, r::Int, epsilon::T) where T <: Real
  (cases, features) = size(M)
  vertex = zeros(T, classes, classes - 1)
  (b, c, d) = (classes - 1, sqrt(classes), sqrt(classes - 1))
  vertex[1, :] .= one(T) / d
  for i = 1:(classes - 1) # create the simplex vertices
    vertex[i + 1, :] .= -(one(T) + c) / (b * d)
    vertex[i + 1, i] = vertex[i + 1, i] + c / d
  end
  Z = zeros(T, cases, classes - 1) # discriminant columns
  for case = 1:cases 
    if class[case] != 0
      Z[case, :] .= vertex[class[case], :]
    end
  end
  Y = [M sparse(Z)]
  (maxiters, tol) = (1000, 1e-6) # carry out MCDA
  R = similar(Y)
  U = randn(cases, r)
  V = randn(r, features + classes - 1)
  old_loss = 1e20
  for iteration = 1:maxiters # use alternating least squares and MM
    for i in eachindex(Y) # compute current residuals
      (j, k) = i.I
      R[i] = Y[i] - dot(U[j, :], V[:, k])
    end
    S = (U' * U + epsilon * I) \ U' # update V
    V = S * R + (S * U) * V
    for i in eachindex(Y) # compute current residuals
      (j, k) = i.I
      R[i] = Y[i] - dot(U[j, :], V[:, k])
    end
    M = (V * V' + epsilon * I) \ V # update U
    U = R * M' + U * (V * M')
    loss = sum(abs2, R) # check for convergence
    if abs(old_loss - loss) < (old_loss + 1.0) * tol
      break
    end
    old_loss = copy(loss)
  end
  assigned = copy(class) # classify the unclassified cases
  d = zeros(classes)
  for case = 1:cases
    if class[case] == 0
      predicted = vec(U[case, :]' * V[:, features + 1:end])
      for j = 1:classes
        d[j] = norm(predicted  - vec(vertex[j, :]))
      end
      assigned[case] = argmin(d) 
    end
  end
  return assigned
end
