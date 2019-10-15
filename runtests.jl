#=
Tests for the series exercise

Implementation note:
The slices function should raise a DomainError with a meaningful error
message if its size argument doesn't fit the series.
=#
using Test

include("series.jl")


# Tests adapted from `problem-specifications//canonical-data.json` @ v1.0.0

@testset "slices of one from one" begin
    @test slices("1", 1) == ["1"]
end

@testset "slices of one from two" begin
    @test slices("12", 1) == ["1", "2"]
end

@testset "slices of two" begin
    @test slices("35", 2) == ["35"]
end

@testset "slices of two overlap" begin
    @test slices("9142", 2) == ["91", "14", "42"]
end
#
@testset "slices can include duplicates" begin
    @test slices("777777", 3) == ["777", "777", "777", "777"]
end

@testset "slice length is too large" begin
    @test_throws DomainError slices("12345", 6)
end

@testset "slice length cannot be zero" begin
    @test_throws DomainError slices("12345", 0)
end


@testset "slice length cannot be negative" begin
    @test_throws DomainError slices("123", -1)
end

@testset "empty series is invalid" begin
    @test_throws DomainError slices("", 1)
end
