using Documenter, GeoMapping

makedocs(modules = [GeoMapping], sitename = "GeoMapping.jl")

deploydocs(
    repo = "github.com/Alexander-Barth/GeoMapping.jl.git",
)
