"""
    - script skeleton for julia
"""
#%%imports
using Logging

#load project packages
include(joinpath(@__DIR__,"./_projectbuildingblocks.jl"))
using .ProjectBuildingBlocks: ProjectBuildingBlocks as pbb

#setup logging
global_logger(Logging.ConsoleLogger(stdout, Logging.Info))

#%%constants

#%%definitions

#%%control

#%%main
const PROJ_PATHS::Dict{String,String} = pbb.get_paths("./_paths.sh")
println(@__DIR__)
println(PROJ_PATHS)