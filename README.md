# AlgorithmsFromTheBook.jl

AlgorithmsFromTheBook.jl collects the Julia code in Kenneth Lange's book _Algorithms from THE BOOK_. To access the functions in the book, simply install the package
```julia
using Pkg
Pkg.clone("https://github.com/Hua-Zhou/AlgorithmsFromTheBook.jl.git")
```
For example, to test the Peasant Multiplication algorithm in Chapter 1,
```julia
c = peasantproduct(10, 33)
```
To read the source code of a function,
```julia
@edit peasantproduct(10, 33)
```