#!/bin/bash

#   - absolute paths used across the project
#   - substituted in bash scripts by
#       - sourcing `_path.sh` at the start of the script 
#   ```bash
#   source <relative/path/to/_path.sh>
#   ```
#   - accessible in python via 
#   - used to not upload absolute paths to github
#   - easy adaptation if setup differs across machines 

#paths
project_path1=<absolute/path/to/your/project>
project_path2=<absolute/path/to/your/project>
project_path3=<absolute/path/to/your/project>