# RepoTemplate_LuSt

Template for a repository structure.

To clone this repo (including its submodules) you can use the following command:
```bash
git clone --recurse-submodules https://github.com/TheRedElement/RepoTemplate_LuSt.git
```
If you don't need the submodules just omit `--recurse-submodules`

> [!IMPORTANT]  
> If you find this repository useful, please add the following acknowledgement in your work:
> I/We acknowledge the work that went into curating a github-repository template to start working immediately.
> The original we used can be found on [https://github.com/TheRedElement/RepoTemplate_LuSt/tree/main](https://github.com/TheRedElement/RepoTemplate_LuSt/tree/main).

# Parts

## [code](./code/)

Space for the code of your project.
A naming convention that integrates with my standard workflow is as follows:
* all [bash scripts](./code/bash/) are named starting with a zero-padded 2-digit integer i.e., `00_name.sh`
    * the [bash scripts](./code/bash/) are the main control of the project workflow
    * the number denotes the order of execution
* any script executed from within one of the main [bash scripts](./code/bash/) are named starting with zero-padded 3-digit integers i.e., `000_name.sh`
    * the 3-digit integer denotes the execution-order from within the main [bash scripts](./code/bash/)
        * for `03_example.sh` that would mean
            * the first script executed from within is named `031_routine.py`
            * the second script executed from within is named `032_routine.jl`
            * ...
* scripts that are not used anymore but also can't be deleted yet, follow the same naming scheme, except they get assigned `9` as their first digit
    * for main [bash scripts](./code/bash/) that means: `90_archived.sh`
    * for subscripts that means: `900_archived.jl`, `901_archived.jl`

### [bash](./code/bash/)

A directory for bash-scripts.
A slurm-script template is provided.


### [code_snippets/](./code/LuStCodeSnippets)

Submodule containing useful code snippets.

An important example is [install_requirements_python.py](./code/LuStCodeSnippets/install_requirements_python.py).
This is a script to install all requirements listed in a `requirements.txt` file, which will ignore any installs that result in errors.
Idea is to prevent errors arising from windows/linux incompitbilities.

### [data](./code/data/)

Store your datasets here.

### [execlogs](./code/execlogs/)

This is a space for any output of scripts that shall be stored for later inspection.
Examples would be slurm script outputs and errors.

### [src_jl](./code/src_jl) and [src_jl_demo](./code/src_jl_demo)

These are two directories one can use to store, demonstrate, and test `julia` modules created during the project.
* [src_jl](./code/src_jl) is hereby designated to the module creation.
* [src_jl_demo](./code/src_jl_demo) is designated for demos.
* [src_jl_tests](./code/src_jl_tests) is designated for unit tests.

### [src_py](./code/src_py/) and [src_py_demo](./code/src_py_demo/)

These are two directories one can use to store, demonstrate, and test `python` modules created during the project.
* [src_py](./code/src_py/) is hereby designated to the module creation.
* [src_py_demo](./code/src_py_demo/) is designated for testing and demos.
* [src_py_tests](./code/src_py_tests) is designated for unit tests.
    * an exemplary template for unit tests can be found in [submodulename_test_template.py](./code/src_py_tests/submodulename_test_template.py)
    * we use [pytest](https://docs.pytest.org/en/stable/) for testing python code

### [_paths.sh](./code/_paths.sh)

A single file containing **absolute** paths relevant in the project.
The idea is to not leak any local paths (from i.e., supercomputers) when uploading code to [GitHub](https://github.com).
To achieve this, proceed as follows:
* do **NOT** sync [_paths.sh](./code/_paths.sh) to GitHub (uncomment the respective line in [.gitignore](.gitignore))
* adjust your script based on the language you are using (see below)

#### Bash Scripts
* source the file at the beginning of your script
```bash
source <path/to/_paths.sh>
```
* expand the variables defined in [_paths.sh](./code/_paths.sh) whenever you need an absolute path
```bash
abspath="${project_path}/<relative/path/to/object>"
```

#### Python
* have a look at [main.py](./code/main.py) for an example
* a utility function is included in [_projectbuildingblocks.py](./code/_projectbuildingblocks.py)
    * this function will load all defined paths into a dictionary mapping variable names to paths
```python
PROJ_PATHS:dict = pbb.get_paths("<path/to/_paths.sh>")
```

#### Julia
* have a look at [main.jl](./code/main.jl) for an example
* a utility function is included in [_projectbuildingblocks.jl](./code/_projectbuildingblocks.jl)
    * this function will load all defined paths into a dictionary mapping variable names to paths
```julia
const PROJ_PATHS::Dict{String,String} = pbb.get_paths("<path/to/_paths.sh>")
```


### [_projectbuildingblocks.*](./code/_projectbuildingblocks.*)

These are files designed to host any building blocks that are used across multiple files in the project.
Examples could be data-loading or standard plotting routines.
I use the convention `pub_<float>_<context>()` for functions and methods that are desinge to generate content for publication (paper/talk/poster).

### [pyproject.toml](./code/pyproject.toml)

Template for a pyproject file.
Defines [src_py](./code/src_py/) as a package.

### [LICENSE](./code/LICENSE)

Template for a MIT Licence.
Only applicable to files in [code](./code/).

## [emails](./emails/)

$\LaTeX$ template for an email (to easily discuss also over equations).

## [report](./report/)

Space for your report.
Will typically end up being a $\LaTeX$ directory tree.
It is advised that graphics generated in  [code](./code/) are directly stored in a `gfx` directory within [report](./report/) to have a contained report.

## [.gitignore](./.gitignore)

A template `.gitignore` file containing ignores for
* `python`
* `julia`
* $\LaTeX$

## [.gitmodules](./.gitmodules)

Pointer to git modules included in the repo.

# Some Useful Things

## Creating Environments in Python
If you are working with [Python](https://www.python.org/), a standard way to make sure your project is reproducible is to create a virtual environment for the project.
To do so navigate to project root directory and call the following:
```bash
python3 -m venv venv
```
This will create a virtual environement called `venv` in your directory.
The [.gitignore](./.gitignore) file will ignore the environment for git.

To activate your environment use the following from your project root directory:
```bash
source venv/bin/activate
```

Now you can also install packages using [pip](https://pypi.org/project/pip/):
```bash
pip3 install <packagename>
```

To provide yourself (and others) with an easy way of reproducing your environment simpy `freeze` the environment:
```bash
pip3 freeze > requirements.txt
```
This creates a new file [requirements.txt](./requirements.txt), which contains all your installed packages including versions.
To install all packages from a [requirements.txt](./requirements.txt) file just call the following within your activated environemnt:
```bash
pip3 install -r requirements.txt
```