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

# Conventions

A naming convention that integrates with my standard workflow is as follows:
* all [bash scripts](./bash) are named starting with a zero-padded 2-digit integer i.e., `00_name.sh`
    * the [bash scripts](./bash) are the main control of the project workflow
    * the number denotes the order of execution
* any script executed from within one of the main [bash scripts](./bash) are named starting with zero-padded 3-digit integers i.e., `000_name.sh`
    * the 3-digit integer denotes the execution-order from within the main [bash scripts](./bash)
        * for `03_example.sh` that would mean
            * the first script executed from within is named `031_routine.py`
            * the second script executed from within is named `032_routine.jl`
            * ...
* scripts that are not used anymore but also can't be deleted yet, follow the same naming scheme, except they get assigned `9` as their first digit
    * for main [bash scripts](./bash) that means: `90_archived.sh`
    * for subscripts that means: `900_archived.jl`, `901_archived.jl`

# Parts

## [.github](.github/)

Special directory used by GitHub to automate workflows.

## [bash](./bash)

A directory for bash-scripts.
A slurm-script template is provided.

## [data](./data)

Store your datasets here.

## [emails](./emails/)

$\LaTeX$ template for an email (to easily discuss also over equations).

## [execlogs](./execlogs)

This is a space for any output of scripts that shall be stored for later inspection.
Examples would be slurm script outputs and errors.

## [gfx](./gfx/)

All figures generated in your work go here.
These can be referenced in [summary.md](./summary.md)

## [submodules/](./submodules/)

Any submodules used in the project.
Common things would be forks of repositories.

### [LuStCodeSnippets](./submodules/LuStCodeSnippets/)

Submodule containing useful code snippets.

## [tests/](./tests/)

directory containing unit tests.

## [_paths.sh](./_paths.sh)

A single file containing **absolute** paths relevant in the project.
The idea is to not leak any local paths (from i.e., supercomputers) when uploading code to [GitHub](https://github.com).
To achieve this, proceed as follows:
* do **NOT** sync [_paths.sh](./_paths.sh) to GitHub (uncomment the respective line in [.gitignore](.gitignore))
* adjust your script based on the language you are using (see below)

### Bash Scripts
* source the file at the beginning of your script
```bash
source <path/to/_paths.sh>
```
* expand the variables defined in [_paths.sh](./_paths.sh) whenever you need an absolute path
```bash
abspath="${project_path}/<relative/path/to/object>"
```

### Python
* have a look at [main.py](./main.py) for an example
* a utility function is included in [_projectbuildingblocks.py](./_projectbuildingblocks.py)
    * this function will load all defined paths into a dictionary mapping variable names to paths
```python
PROJ_PATHS:dict = pbb.get_paths("<path/to/_paths.sh>")
```

### Julia
* have a look at [main.jl](./main.jl) for an example
* a utility function is included in [_projectbuildingblocks.jl](./_projectbuildingblocks.jl)
    * this function will load all defined paths into a dictionary mapping variable names to paths
```julia
const PROJ_PATHS::Dict{String,String} = pbb.get_paths("<path/to/_paths.sh>")
```


## [_projectbuildingblocks.*](_projectbuildingblocks.*)

These are files designed to host any building blocks that are used across multiple files in the project.
Examples could be data-loading or standard plotting routines.
I use the convention `pub_<float>_<context>()` for functions and methods that are desinge to generate content for publication (paper/talk/poster).


## [.gitignore](./.gitignore)

A template `.gitignore` file containing ignores for
* `python`
* `julia`
* $\LaTeX$

## [.gitmodules](./.gitmodules)

Pointer to git modules included in the repo.

## [bib-refs.bib](./bib-refs.bib)

Contains all the literature you are referencing in [summary.md](./summary.md)

## [CITATION.cff](CITATION.cff)

Template for a bibliography entry.

## [LICENSE](LICENSE)

Template for a MIT Licence.

## [main.*](main.*)

main files in various languages.
should contain the top-level routines to be run.

## pandoc-header.html

HTML header for [pandoc](https://pandoc.org/) to produce nice html outputs of [summary.md](./summary.md)
html can be generated by calling the following (pandoc <= v2.x)

```bash
pandoc summary.md -o summary.html --standalone --mathjax --css https://pandoc.org/demo/pandoc.css --self-contained -H pandoc-header.html --toc --toc-depth=2
```

## [pyproject.toml](pyproject.toml)

Template for a pyproject file.


## [README.md](./README.md)

readme of the project.

## [summary.md](./summary.md)

summary file for your latest results.
essentially serves as a living paper draft.
embed images from [gfx](./gfx/) to always have the latest plots ready.

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