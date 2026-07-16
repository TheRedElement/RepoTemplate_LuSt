"""
    - script skeleton for julia
"""
#%%imports
using Logging

#load project packages
include(joinpath(@__DIR__,"../../src/julia/Package.jl"))
using .Package: Package as pkg

#setup logging
global_logger(Logging.ConsoleLogger(stdout, Logging.Info))

#%%constants

#%%definitions

#%%control

#%%main
const PROJ_PATHS::Dict{String,Any} = pkg.get_config("./config.json")
println(@__DIR__)
println(PROJ_PATHS)
