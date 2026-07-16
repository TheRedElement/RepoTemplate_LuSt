"""
    - script skeleton for julia
"""
#%%imports
using Logging

#load project packages
include(joinpath(@__DIR__,"../../src/julia/Julia.jl"))
using .Julia: Julia as julia

#setup logging
global_logger(Logging.ConsoleLogger(stdout, Logging.Info))

#%%constants

#%%definitions

#%%control

#%%main
const PROJ_PATHS::Dict{String,Any} = julia.get_config(joinpath(@__DIR__,"../../config.json"))
println(@__DIR__)
println(PROJ_PATHS)
