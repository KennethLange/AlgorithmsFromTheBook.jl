# AlgorithmsFromTheBook.jl

| **Build Status** | **Code Coverage**  |
|------------------|--------------------|
| [![Build Status](https://travis-ci.org/KennethLange/AlgorithmsFromTheBook.jl.svg?branch=master)](https://travis-ci.org/KennethLange/AlgorithmsFromTheBook.jl) [![Build status](https://ci.appveyor.com/api/projects/status/up3skeku37b0vyyf/branch/master?svg=true)](https://ci.appveyor.com/project/KennethLange/algorithmsfromthebook-jl/branch/master) | [![Coverage Status](https://coveralls.io/repos/github/KennethLange/AlgorithmsFromTheBook.jl/badge.svg?branch=master)](https://coveralls.io/github/KennethLange/AlgorithmsFromTheBook.jl?branch=master) [![codecov](https://codecov.io/gh/KennethLange/AlgorithmsFromTheBook.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/KennethLange/AlgorithmsFromTheBook.jl) |  


AlgorithmsFromTheBook.jl collects the Julia code in Kenneth Lange's book _Algorithms from THE BOOK_. To access the functions in the book, simply install the package in Julia v1.0 or later   
```julia
using Pkg   
Pkg.clone("https://github.com/KennethLange/AlgorithmsFromTheBook.jl.git")
```
For example, to test the Euclid algorithm in Chapter 1,   
```julia
using AlgorithmsFromTheBook  
gcd = euclid(600, 220)
```
To read the source code of a function,   
```julia
@edit euclid(600, 220)
```