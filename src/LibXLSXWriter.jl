module LibXLSXWriter

using libxlsxwriter_jll
using CEnum
using Printf

# function definitions for the generated libxlsxwriter_api.jl
function strcasecmp(a::S, b::S) where {S<:AbstractString}
    lowercase(a) == lowercase(b)
end

string_copy_free = Base.unsafe_string

include("generated/libxlsxwriter_api.jl")
include("helpers.jl")
include("lxw.jl")

#= 1153 identifiers
for n in names(@__MODULE__; all=true)
   if Base.isidentifier(n) && n ∉ (Symbol(@__MODULE__), :eval, :include)
      @eval export $n
   end
end
=#

end
