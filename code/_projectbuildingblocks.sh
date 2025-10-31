#!/bin/bash

#   - building blocks that are used in multiple files of the project
#   - use by simply sourcing and calling the functions
#
#   ```bash
#       source <path/to/_projectbuildingblocks.sh>
#   ``` 

#%%definitions
function_template() {
    local help='
        - function description

        Usage
        -----
        ```bash
        function_template [--help] [val1] [val2] [kwarg1=<kwval1>] [kwarg2=<kwval2>] [kwarg3=<kwval3>]
        ```

        Parameters
        ----------
        - $1 (`<name>`) [optional]
            - <type>
            - description
        - `kwarg1` [optional]
            - <type>
            - description
        - $3+ (`arr1` `arr2` ...)
            - (types) variable arguments
            - description

        Example
        -------
        ```bash
        function_template val1 val2 kwarg1=kval1 kwarg2=kval2 kwarg3=kval3
        ```

        Output
        ------
        ```bash
        called function_template val1 val2 kwarg1=kval1 kwarg2=kval2 kwarg3=kval3
        ```
        Comments
        --------
    '

    ################
    #DEAL WITH ARGS#
    ################
    declare -a args=()  #positional args via array
    declare -A kwargs=( #emulate named kwargs via associative array
        [kwarg1]="val1"
        [kwarg2]="val2"
        [kwarg3]="val3"
    )
    for arg in "$@"; do
        if [[ "$arg" == *=* ]]; then    #check if arg contains an `=` (kwargs)
            key="${arg%%=*}"            #name (before `=`)
            val="${arg#*=}"             #value (after `=`)
            kwargs[$key]="$val"         #override default
        else                            #interpret as positional
            args+=("$arg")
        fi
    done

    #default values for positional args
    local arg1="${args[0]:-none}"
    local arg2="${args[0]:-none}"

    if [[ "${arg1}" == "--help" ]]; then
        echo "$help"
    else
        ###############
        #FUNCTION BODY#
        ###############

        echo $"called function_template" \
            "${arg1} ${arg2}" \
            "kwarg1=${kwargs[kwarg1]}" \
            "kwarg2=${kwargs[kwarg2]}" \
            "kwarg3=${kwargs[kwarg3]}"
    fi
}

#prevent direct execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This is a library file. Source it in your scripts: source <path/to/_projectbuildingblocks.sh>"
fi