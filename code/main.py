"""
    - script skeleton for python
"""
#%%imports
import importlib
import logging
import os
import sys
import warnings

#deactivate annying but irrelevant warnings
warnings.filterwarnings("ignore", message="set_ticklabels()")

#get absolute path to current file
DIR_PATH:str = os.path.dirname(os.path.realpath(__file__)) + "/"
sys.path.append(DIR_PATH)

#load project packages
import _projectbuildingblocks as pbb
importlib.reload(pbb)

#get project paths
PROJ_PATHS:dict = pbb.get_paths(f"{DIR_PATH}./_paths.sh")

#set up logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
local_logger = logging.getLogger(__name__)
local_logger.setLevel(logging.INFO)
pbb_logger = logging.getLogger("_projectbuildingblocks")
pbb_logger.setLevel(logging.INFO)

#%%constants

#%%definitions

#%%control

#%%main
def main():
    global DIR_PATH
    global PROJ_PATHS

    print(DIR_PATH)
    print(PROJ_PATHS)
    return

if __name__ =="__main__":
    main()