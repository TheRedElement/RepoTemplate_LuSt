"""

template for a julia module

- to use call the following
```julia
    include(joinpath(@__DIR__, "<relative/path/to/Project.jl>"))
    using .Julia: Julia as julia
```
- the module is called `Julia` to have it general enough so it works across projects
    - to publish a standalone package
        - rename the project
        - rename the entry file
        - rename the module
        - change the `Project.toml` file accordingly

# Exceptions

# Types

# Structs
- `StructTemplate` -- template for struct definitions

# Functions
- `function_template` -- template for function definitions

"""

module Julia

#%%imports

#%%exports

#metadata

#submodules (make visible to parent module)
begin
    include("./Loaders.jl")

    #load (make visible to parent module)
    using .Loaders

    #reexport (make accessible to user)
    export Loaders
end


#%%constants

begin #local definitions
    """
        StructTemplate(x1::AbstractArray{Number,3}=Array{Number}(undef,0,0,0); x2<:Number=0.0)

    struct representing ...

    <long description>

    # Fields
    - `x1`
        - `AbstractArray{Number,3}`, optional
        - <description>
        - the default is `Array{Number}(undef,0,0,0)`
    - `x2`
        - `Number`, optional
        - <description>
        - the default is `0.0`

    # See also
    <related objects>

    # Examples

        ```jldoctest
        julia> <julia code>
        <output>
        [...]
        ```

    # Extended help
    <very long description>

    ## Dependencies
    -

    ## Raises
    -
    """
    struct StructTemplate{T <: Number}
        x1::AbstractArray{T,3}
        x2::T

        #inner constructor (to allow default values)
        function StructTemplate(
            x1::AbstractArray{T,3}=Array{Number}(undef,0,0,0);    #positional argument
            x2::T=0.0,                                        #named argument
            ) where {T <: Number}

            new{T}(x1, x2)
        end
    end

    """
        function_template(parg1<:Real, parg2:Symbol=:x2; narg1::String, narg2::Int=0)

    returns ...

    <long description>

    # Arguments
    - `parg1`
        - `Real`
        - <description>
    - `parg2`
        - `Symbol`, optional
        - <description>
        - the default is `:x2`
    - `narg1`
        - `Symbol`
        - <description>
    - `narg2`
        - `Int`, optional
        - <description>
        - the default is `0`

    # Returns
    - `out`
        - `Any`
        - <description>

    # See also
    <related objects>

    # Examples

        ```jldoctest
        julia> <julia code>
        <output>
        [...]
        ```

    # Extended help
    <very long description>

    ## Dependencies
    -

    ## Raises
    - `SomeException`
        - <description>
    """
    function function_template(
        parg1::T,                   #positional argument
        parg2::Symbol=:x2;          #positional argument
        narg1::String,              #named argument
        narg2::Int=0,             #named argument
        )::Any where {T <: Real}

        out = nothing

        return out
    end
end
end #module
