# AlgorithmsFromTheBook.jl

| **Build Status** | **Code Coverage**  |
|------------------|--------------------|
| [![Build Status](https://travis-ci.org/Hua-Zhou/AlgorithmsFromTheBook.jl.svg?branch=master)](https://travis-ci.org/Hua-Zhou/AlgorithmsFromTheBook.jl) [![Build status](https://ci.appveyor.com/api/projects/status/up3skeku37b0vyyf/branch/master?svg=true)](https://ci.appveyor.com/project/Hua-Zhou/algorithmsfromthebook-jl/branch/master) | [![Coverage Status](https://coveralls.io/repos/github/Hua-Zhou/AlgorithmsFromTheBook.jl/badge.svg?branch=master)](https://coveralls.io/github/Hua-Zhou/AlgorithmsFromTheBook.jl?branch=master) [![codecov](https://codecov.io/gh/Hua-Zhou/AlgorithmsFromTheBook.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/Hua-Zhou/AlgorithmsFromTheBook.jl) |  


AlgorithmsFromTheBook.jl collects the Julia code in Kenneth Lange's book _Algorithms from THE BOOK_. To access the functions in the book, simply install the package   
```julia
using Pkg   
Pkg.clone("https://github.com/Hua-Zhou/AlgorithmsFromTheBook.jl.git")
```
For example, to test the Peasant Multiplication algorithm in Chapter 1,   
```julia
using AlgorithmsFromTheBook  
c = peasantproduct(10, 33)
```
To read the source code of a function,   
```julia
@edit peasantproduct(10, 33)
```