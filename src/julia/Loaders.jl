
"""

functions for loading data

- part of the `Julia.jl` project package

# Exceptions

# Types

# Structs

# Functions
- `load_config()` -- loads project configuration

"""
module Loaders

#%%imports
using JSON

#%%intradependencies

#%%exports
export get_config


#%%definitions
"""
    load_config(paths::String)

returns local configurations of the project

- extracts configs from a json (usually `config.json`)
    - paths
    - global constants
    - ...


# Arguments
- `path`
    - `String`
    - path to configs file

# Returns
- `config`
    - `Dict{String,Any}`

# See also

# Examples

    ```jldoctest
    julia> config = get_config("<path/to/config.json>")
    ERROR: LoadError: AssertionError: [...]
    ```

# Extended help

## Dependencies
- `JSON`

## Raises
    `AssertionError`
        - if wrong file type is passed in `path`
"""
function get_config(
    path::String
    )::Dict{String,Any}
    @assert path[end-4:end] == ".json" "`path` has to point to a `.json` file but is $path"

    config = JSON.parsefile(path)
    return config
end

end #module
