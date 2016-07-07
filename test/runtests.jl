using Extern
using Base.Test
using StatsBase

@extern FakePackage function test1(x)
    return x + 1
end

@test !isdefined(Main, :test1)

@test @extern(FakePackage, 1 + 1) === nothing

# StatsBase is installed and callable from Main (via `using`)
@extern StatsBase type SomeType
    w::WeightVec
    x::Int
end

@test isdefined(Main, :SomeType)

# Package is installed (in test/REQUIRE) but not callable from Main
@test @extern(DataStructures, type OtherType <: OrderedDict end) === nothing
@test !isdefined(Main, :OtherType)
