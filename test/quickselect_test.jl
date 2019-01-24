module QuickselectTest

using AlgorithmsFromTheBook, Test

@testset "quick select" begin
k = 8;
x = [5, 4, 3, 1, 2, 8, 7, 6];
xk = quickselect(x, k)
k = 5;
x = ['a', 'c', 'd', 'b', 'f', 'e', 'h', 'g'];
xk = quickselect(x, k)
@test xk == 'e'
end

end