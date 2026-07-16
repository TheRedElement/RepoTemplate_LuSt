"""
    - script skeleton for python
"""
#%%imports
import importlib
import logging
import os
import sys
import warnings

#deactivate annoying but irrelevant warnings
warnings.filterwarnings("ignore", message="set_ticklabels()")

#get absolute path to current file
DIR_PATH:str = os.path.dirname(os.path.realpath(__file__)) + "/"
sys.path.append(DIR_PATH)

#load project packages
from python import load_config

#get project paths
CONFIG:dict = load_config(f"{DIR_PATH}../../config.json")

#set up logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
local_logger = logging.getLogger(__name__)
local_logger.setLevel(logging.INFO)
main_logger = logging.getLogger("main")
main_logger.setLevel(logging.INFO)

#%%constants

#%%definitions

#%%control

#%%main
def main():
    global DIR_PATH
    global PROJ_PATHS

    print(DIR_PATH)
    print(CONFIG)
    return

if __name__ =="__main__":
    main()
