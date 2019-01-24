module NegBinTest

using AlgorithmsFromTheBook, Distributions, Test

@testset "neg. bin." begin
(n, r, p) = (100, 5., .25);
x = rand(NegativeBinomial(r, p), n);
(p, r) = negbinomial(x);
obj1 = loglikelihood(NegativeBinomial(r, p), x);
println("r = ",r," p = ",p," obj = ",obj1);
(avg, ssq) = (mean(x), var(x));
(p, r) = (avg / ssq, avg^2 / (ssq - avg));
obj2 = loglikelihood(NegativeBinomial(r, p), x);
println("r = ",r," p = ",p," obj = ",obj2);
@test obj1 > obj2
end

end