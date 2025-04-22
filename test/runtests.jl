using LibXLSXWriter
using Test

@testset "anatomy" begin
    include("anatomy.jl")
end
@testset "array_formula" begin
    include("array_formula.jl")
end
@testset "autofilter" begin
    include("autofilter.jl")
end
@testset "background" begin
    include("background.jl")
end
@testset "chart" begin
        include("chart.jl")
end
@testset "chart_data_labels" begin
    include("chart_data_labels.jl")
end
@testset "chart_data_tools" begin
        include("chart_data_tools.jl")
end
@testset "chart_pie_colors" begin
    include("chart_pie_colors.jl")
end
@testset "chart_scatter" begin
        include("chart_scatter.jl")
end
@testset "chartsheet" begin
    include("chartsheet.jl")
end
@testset "comments1" begin
    include("comments1.jl")
end
@testset "comments2" begin
    include("comments1.jl")
end
@testset "conditional_format1" begin
    include("conditional_format1.jl")
end
@testset "constant_memory" begin
    include("constant_memory.jl")
end
@testset "data_validate" begin
    include("data_validate.jl")
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
@testset "image_buffer" begin
    include("image_buffer.jl")
end
@testset "macro" begin
    include("macro.jl")
end
@testset "merge_range" begin
    include("merge_range.jl")
end
@testset "output_buffer" begin
    include("output_buffer.jl")
end
@testset "panes" begin
    include("panes.jl")
end
@testset "rich_strings" begin
    include("rich_strings.jl")
end
@testset "tables" begin
    include("tables.jl")
end
@testset "watermark" begin
    include("watermark.jl")
end
@testset "worksheet_protection" begin
    include("worksheet_protection.jl")
end
