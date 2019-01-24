module NaiveBayesTest

using AlgorithmsFromTheBook, Random, Test

@testset "naive Bayes" begin
Random.seed!(123)
(features, cases, classes) = (4, 10, 2);
(max_outcomes, pseudo_obs) = (10, 0.1);
X = rand(0:max_outcomes, cases, features); # training data
class = rand(1:classes, cases); # classes of training data
(ln_prior, ln_cond_prob) = estimate(X, class, classes, pseudo_obs);
test_case = rand(0:max_outcomes, features); # test data
test_class = predict(test_case, ln_prior, ln_cond_prob)
@test test_class == 1
end

end