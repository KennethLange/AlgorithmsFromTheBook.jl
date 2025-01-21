export bucketsort

"""Sorts the entries of x contained in [0,1] by bucket sort."""
function bucketsort(x::Vector{T}, buckets::Int) where T <: Real
  bucket = [eltype(x)[] for i = 1:buckets]
  for i = 1:length(x) # insert the numbers into their buckets
    b = ceil(Int, buckets * x[i])
    push!(bucket[b], x[i])
  end
  for i = 1:buckets # sort the buckets
    sort!(bucket[i])
  end
  return vcat(bucket...) # return the concatenated buckets
end
