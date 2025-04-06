using LibXLSXWriter
using Test

@testset "array_formula" begin
    include("array_formula.jl")
end
@testset "chart_pie_colors" begin
    include("chart_pie_colors.jl")
end
@testset "chart_scatter" begin
    include("chart_scatter.jl")
end
@testset "comments1" begin
    include("comments1.jl")
end
@testset "demo" begin
    include("demo.jl")
end
@testset "doc_properties" begin
    include("doc_properties.jl")
end
@testset "format_num_format" begin
    include("format_num_format.jl")
end
@testset "panes" begin
    include("panes.jl")
end
