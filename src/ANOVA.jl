export MM_ANOVA

"""Estimates ANOVA parameters with no missing data."""
function two_way_ANOVA(Y::Array{T, 3}) where T <: Real
  (i, j, k) = size(Y)
  S = sum(Y, dims = 3)
  (alpha, beta) = (sum(S, dims = 2), sum(S, dims = 1))
  mu = sum(alpha) / (i * j * k)
  alpha = alpha / (j * k) .- mu
  beta = beta / (i * k) .- mu
  return (mu, alpha, beta)
end

"""Estimates ANOVA parameters with missing data by an MM
algorithm. The observed data appear in Y. The corresponding 
entries of W are 0 for missing data and 1 for observed data."""
function MM_ANOVA(Y::Array{T, 3}, W::BitArray{3}) where T <: Real
  (i, j, k) = size(Y)
  (mu, alpha, beta) = (zero(T), zeros(T, i), zeros(T, j))
  P = zeros(size(Y)) # predicted values
  Z = zeros(size(Y)) # observed and imputed data
  old_rssq = Inf
  for n = 1:100 # MM iteration loop
    rssq = zero(T) # residual sum of squares
    for ii = 1:i
      for jj = 1:j
        for kk = 1:k
          if W[i, j, k] # observed
            residual = Y[ii, jj, kk] - P[ii, jj, kk]
            rssq = rssq + W[ii, jj, kk] * residual^2
          else # missing
            P[ii, jj, kk] = mu + alpha[ii] + beta[jj]
          end
        end
      end
    end
    Z = W .* Y + (one(T) .- W) .* P # false = 0 and true = 1
    (mu, alpha, beta) = two_way_ANOVA(Z) # MM update
    if abs(old_rssq - rssq) < 1e-8 # check for convergence
      return (mu, alpha, beta)
    end
    old_rssq = rssq
  end
  return (mu, alpha, beta)
end

# Y = zeros(3, 2, 4);
# Y[:, :, 1] = [1 2; 3 4; 5 6];
# Y[:, :, 2] = -Y[:, :, 1];
# Y[:, :, 3] = Y[:, :, 1] / 2; 
# Y[:, :, 4] = -Y[:,:,1] / 2; 
# W = trues(size(Y)); # W = true for observed
# W[1, 1, 1] = false; # W = false for missing
# W[3, 2, 4] = false;
# (mu, alpha, beta) = MM_ANOVA(Y, W);
# println("mu = ",mu);
# println("alpha = ",alpha);
# println("beta = ",beta);


  