"""template for a python package

```python
import importlib

import package
importlib.reload(package)
```

Exceptions

Classes
    - `ClassTemplate` -- template for class definitions

Functions
    - `load_config` -- loads project configs
    - `function_template` -- template for function definitions

Other Objects
"""

#%%imports
import json
from typing import Any, Dict

#%%definitions
def load_config(
    path:str
    ) -> Dict[str,Any]:
    """returns local configurations of the project

    - extracts configs from a json (usually `config.json`)
        - paths
        - global constants
        - ...

    Parameters
        - `path`
            - `str`
            - path to configs file

    Raises
        - `AssertionError`
            - if wrong file type is passed in `path`

    Returns
        - `config`
            - `Dict[str,Any]`

    Dependencies
        - `json`
        - `typing`

    """
    assert path[-5:] == ".json", f"`path` has to point to a `.json` file but is {path}"

    with open(path, "r") as f:
        config = json.load(f)

    return config

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

