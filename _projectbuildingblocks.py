
"""building blocks used across the project

    - building blocks that are used in multiple files of the project
    - use by importing

    ```python
    import importlib

    import _projectbuildingblocks as pbb
    importlib.reload(pbb)
    ```

    Exceptions

    Classes
        - `ClassTemplate` -- template for class definitions

    Functions
        - `get_paths` -- extracts paths relevant for the project
        - `function_template` -- template for function definitions
        - `pub_fig_name` -- template for function generating publication ready figure
        - `pub_tab_name` -- template for function generating publication ready table

    Other Objects
"""

#%%imports
import re
from typing import Dict

#%%definitions
def get_paths(
    paths_file:str
    ) -> Dict[str,str]:
    """extracts paths relevant for the project

    - function to extract paths from a bash file containing paths relevant to the project
        - usually `_path.sh`
    - does so by
        - reading the file
        - extracting groups that match r"([^=\n]+)=([^=\n]+)"
        - converting matches to `dict`
    - usually called at the start of a python script to ensure all the paths are loaded

    Parameters
        - `paths_file`
            - `str`
            - path to `_paths.sh` file
                - file containing project paths

    Raises

    Returns
        - `paths`
            - `Dict[str,str]`
            - dictionary mapping `path_name` (bash variable name) to `path` (absolute path)

    Dependencies
        - `re`
        - `typing`

    """
    with open(paths_file, "r") as f:
        paths = dict(re.findall(r"([^=\n]+)=([^=\n]+)", f.read()))
    return paths

class ClassTemplate:
    """class representing ...

    <long description>

    Attributes
        - `a` [-- short description]
        - ...

	Inferred Attributes
        - `c`
			- `type` [, optional]
			- <description>
			- [the default is <default>]
        - ...

    Methods
        - `add()` -- <short description>

    Dependencies
        -
    """
    def __init__(self,
        ) -> None:
        """constructor

        <long description>

        Parameters
            - `param_name`
                - `type` [, optional]
                - <description>
                - [the default is <default>]
            - ...

        Raises

        Returns
        """
        pass

    def __repr__(self) -> str:
        """returns string representation of the class"""
        return f"{self.__class__.__name__}(" + ", ".join([f"{attr}={val}" for attr, val in self.__dict__.items()]) + ")"

    def __dict__(self) -> dict:
        return eval(str(self).replace(self.__class__.__name__, 'dict'))

    def __call__(self, *args, **kwargs):
        pass

def function_template():
    """returns ...

    <long description>

	Parameters
		- `param_name`
			- `type` [, optional]
			- <description>
			- [the default is <default>]
		- ...

	Raises
		- `SomeException`
			- description

	Returns
		- `return_name`
			- `type`
			- <description>
		- ...

	Dependencies
	    -
    """
    return


def pub_fig_name(*args):
    """generates figure for ...

    - function to generate a figure that is fine-tuned for publication (talk/paper/poster)
    """

    return

def pub_tab_name(*args):
    """generates table for ...

    - function to generate a table that is fine-tuned for publication (talk/paper/poster)
    """

    return

