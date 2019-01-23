module EratosthenesTest

using AlgorithmsFromTheBook, Test

@testset "Eratoshenes" begin
prime_list = eratosthenes(100)
@test all(prime_list .== [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 
    47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97])
end

end