"""
    - script skeleton for julia
"""
#%%imports
using Logging

#load project packages
include(joinpath(@__DIR__,"../../src/julia/Julia.jl"))
using .Julia: Loaders as loaders

#setup logging
global_logger(Logging.ConsoleLogger(stdout, Logging.Info))

#%%constants
const CONFIG::Dict{String,Any} = loaders.get_config(
    joinpath(@__DIR__, "../../config.json")
)

#%%definitions

#%%main
"""
    main()

- defined for easier debugging
"""
function main()
    println(@__DIR__)
    println(CONFIG)

end

main()
