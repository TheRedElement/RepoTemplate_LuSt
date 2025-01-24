# RepoTemplate_LuSt

Template for a repository structure.

# Parts

## [code](./code/)

Space for the code of your project.

### [bash](./code/bash/)

A directory for bash-scripts.
A slurm-script template is provided.

### [data](./code/data/)

Store your datasets here.

### [execlogs](./code/execlogs/)

This is a space for any output of scripts that shall be stored for later inspection.
Examples would be slurm script outputs and errors.

### [src](./code/src/) and [src_demo](./code/src_demo/)

These are two directories one can use to store, demonstrate, and test `julia` modules created during the project.
* [src](./code/src/) is hereby designated to the module creation.
* [src_demo](./code/src_demo/) is designated for testing and demos.

### [src_py](./code/src_py/) and [src_py_demo](./code/src_py_demo/)

These are two directories one can use to store, demonstrate, and test `python` modules created during the project.
* [src_py](./code/src_py/) is hereby designated to the module creation.
* [src_py_demo](./code/src_py_demo/) is designated for testing and demos.

## [emails](./emails/)

$\LaTeX$ template for an email (to easily discuss also over equations).

## [report](./report/)

Space for your report.
Will typically end up being a $\LaTeX$ directory tree.
It is advised that graphics generated in  [code](./code/) are directly stored in a `gfx` directory within [report](./report/) to have a contained report.

## [install_requirements_python.py](./install_requirements_python.py)

Script to install all requirements listed in a `requirements.txt` file.
Will ignore any installs that rsult in errors.
Idea is to prevent errors arising from windows/linux incompitbilities.

# [.gitignore](./.gitignore)

A template `.gitignore` file containing ignores for
* `python`
* `julia`
* $\LaTeX$
