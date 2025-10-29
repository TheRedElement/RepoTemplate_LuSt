
"""
    - building blocks that are used in multiple files of the project
    - use by simply importing

    ```python
    import importlib
    
    import _projectbuildingblocks as pbb
    importlib.reload(pbb)
    ```    
"""

#%%imports
import re
from typing import Dict

#%%definitions
def get_paths(
    paths_file:str
    ) -> Dict[str,str]:
    """
        - function to extract paths from a bash file containing paths relevant to the project
            - usually `_path.sh`
        - does so by
            - reading the file
            - extracting groups that match r"([^=\n]+)=([^=\n]+)"
            - converting matches to `dict`
        
        Parameters
        ----------
            - `paths_file`
                - `str`
                - path to `_paths.sh` file
                    - file containing project paths
        
        Raises
        ------

        Returns
        -------
            - `paths`
                - `Dict[str,str]`
                - dictionary mapping `path_name` (bash variable name) to `path` (absolute path)

        Dependencies
        ------------
            - `re`
            - `typing`

        Comments
        --------
            - usually called at the start of a python script to ensure all the paths are loaded
    """
    with open(paths_file, "r") as f:
        paths = dict(re.findall(r"([^=\n]+)=([^=\n]+)", f.read()))
    return paths

class ClassTemplate:
    """
        - class description

        Attributes
        ----------
            - `verbose`
                - `int`, optional
                - verbosity level
                - the default is `0`
        
        Infered Attributes
        ------------------
            - 

        Methods
        -------
            - 

        Dependencies
        ------------
            -

        Comments
        --------
    """
    def __init__(self,
        verbose:int=0
        ) -> None:
        return
    
    def __repr__(self) -> str:
        return (
            f'{self.__class__.__name__}(\n'
            f'    verbose={repr(self.verbose)},\n'
            f')'            
        )
    
    def __dict__(self) -> dict:
        return eval(str(self).replace(self.__class__.__name__, 'dict'))
    
    def __call__(self, *args, **kwds):
        pass
    
def function_template():
    """
        - function description

        Parameters
        ----------
            - `param_name`
                - `type`, <optional>
                - description
                - the default is `<default>`


        Raises
        ------
            - `error_type`
                - 

        Returns
        -------
            - `varable_name`
                - `type`, <optional>
                - description
                
        Dependencies
        ------------

        Comments
        --------
    """
    return
