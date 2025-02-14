#!/bin/bash

# - building blocks that are used in multiple files of the project

#%%definitions

#prevent direct execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This is a library file. Source it in your scripts: source <path/to/_projectbuildingblocks.sh>"
fi