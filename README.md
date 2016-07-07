# Extern.jl

[![Travis](https://travis-ci.org/ararslan/Extern.jl.svg?branch=master)](https://travis-ci.org/ararslan/Extern.jl)
[![AppVeyor](https://ci.appveyor.com/api/projects/status/c8ul683vudfnkwak/branch/master?svg=true)](https://ci.appveyor.com/project/ararslan/extern-jl/branch/master)
[![Coveralls](https://coveralls.io/repos/github/ararslan/Extern.jl/badge.svg?branch=master)](https://coveralls.io/github/ararslan/Extern.jl?branch=master)

This package defines a macro, `@extern`, which permits the conditional execution of code
if a particular package is available for use.
In this case "available" means that the package is installed (via `Pkg.add` or similar)
and loaded into the `Main` module (via `using`).
Note that the macro does *not* automatically load the given package.

So for example, say you want to make a function that includes a method for a type provided
by another package but you don't want a dependency on that package.
You can define the function like so:

```julia
# Method for a base type
function f(x::Int)
    # Do cool things
end

# Method for an external type
@extern SomePackage function f(z::SomeType)
    # Do even cooler things
end
```

As shown in the above example, the syntax for the macro call is `@extern package expression`.
