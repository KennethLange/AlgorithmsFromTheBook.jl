module PrimetestTest

using AlgorithmsFromTheBook, Primes, Test

@testset "prime test" begin
for i = 1:20
  n = rand(1:10000)
  prime = prime_test(n, 20)
  # println(prime, " ", isprime(n))
  @test prime == isprime(n)
end
end

end