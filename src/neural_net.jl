export train, sigmoid, logistic

using LinearAlgebra, Plots, RDatasets, StatsBase

function identity(z) # activation
  return (z, ones(eltype(z), size(z)))
end

function sigmoid(z) # activation
  (u, du) = (similar(z), similar(z))
  @. u = 1 / (1 + exp(-z))
  @. du = u * (1 - u)
  return (u, du) 
end

function relu(z) # activation
  (u, du) = (similar(z), similar(z))
  s = similar(z)
  @. s = sqrt(z^2 + 1.0e-6)
  @. u = (z + s) / 2
  @. du = (1 + z / s) / 2
  return (u, du)
end

function htan(z) # activation
  (u, du) = (similar(z), similar(z))
  @. u = tanh(z)
  @. du = 1 - u^2
  return (u, du)
end

function logistic(x, y) # loss
  (u, du) = (similar(x), similar(x))
  @. u = - (y * log(x) + (1 - y) * log(1 - x))
  @. du = - (y - x) / (x * (1 - x))
  return (u, du)
end

function square(x, y) # loss
  (u, du) = (similar(x), similar(x))
  @. u = (y - x)^2 / 2
  @. du = x - y
  return (u, du)
end

function smooth_abs(x, y) # loss
  (u, du) = (similar(x), similar(x))
  @. u = sqrt((y - x)^2 + 1.0e-6)
  @. du = (x - y) / u
  return (u, du)
end

function initalize(layers, nodes)
  par = Dict() # parameters reside in a dictionary 
  for l = 1:layers - 1
    (W, b) = ("W" * string(l), "b" * string(l))
    par[W] = randn(nodes[l + 1], nodes[l]) / 100
    par[b] = zeros(nodes[l + 1], 1)
  end
  return par
end

function update(par, grad, layers, t)
  for l = 1:layers - 1 # steepest descent updates
    (W, b) = ("W" * string(l), "b" * string(l))
    par[W] = par[W] - t * grad[W] # update weights
    par[b] = par[b] - t * grad[b] # update intercepts
  end
  return par
end

function forward(X, par, cases, activation, layers)
  z = X # argument for first layer
  cache = [(z, zeros(0,0))]
  for l = 1:layers - 1 # arguments for subsequent layers
    (W, b) = ("W" * string(l), "b" * string(l))
    (a, da) = activation(par[W] * z .+ (par[b] * ones(cases)'))
    push!(cache, (a, da)) # cache argument
    z = a
  end
  return cache
end

function backward(X, y, par, cache, activation, loss, layers)
  grad = Dict()
  (a, da) = cache[layers] # input to output layer
  (obj, dZ) = loss(a, y) # losses and their gradients
  cost = sum(obj) # sum of losses
  dZ = da .* dZ # sample j gradient along column j
  for l = reverse(1:layers - 1)
    (a, da) = cache[l]
    (W, b) = ("W" * string(l), "b" * string(l))
    grad[W] = dZ * a' # sum across cases
    grad[b] = sum(dZ, dims = 2) # sum across cases
    if l > 1
      dZ = par[W]' * dZ # chain rule for next gradient
      dZ = da .* dZ
    end
  end
  return (cost, grad)
end

function train(nodes, X, y, t, iters, fun, plot_name)
  (activation, loss) = fun
  (cases, layers) = (size(X, 2), length(nodes))
  par = initalize(layers, nodes)
  cost = zeros(iters)
  L = length(nodes)
  for i = 1:iters 
    cache = forward(X, par, cases, activation, layers)
    (cost[i], grad) = backward(X, y, par, cache, activation,
      loss, layers)
    par = update(par, grad, layers, t)
  end
  cost_plot = plot(collect(1:iters), cost, legend = false,
    title = "Cost versus Iteration", xlabel = "Iteration",
    ylabel = "Cost", )
#   display(cost_plot)
  savefig(plot_name)
  return (par, cost) 
end
