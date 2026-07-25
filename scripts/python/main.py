"""
    - script skeleton for python
"""
#%%imports
import importlib
import logging
import os
import sys
import warnings

#local imports
# from lust_codesnippets_py.monitoring import logging_convenience as lcmolc
# from lust_codesnippets_py.styles import plotly_style as lcstps

#project packages
from python import load_config

#logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
# lcmolc.setup_logger(level=logging.WARNING)
local_logger = logging.getLogger(__name__)
local_logger.setLevel(logging.INFO)
main_logger = logging.getLogger("main")
main_logger.setLevel(logging.INFO)

#warnings
warnings.filterwarnings("ignore", message="set_ticklabels()")

#style setup
# palette, ls, markers, cmap, hatches = lcstps.tre("dark", "cycle")
# hatches = hatches[0:-1:3]

#other global setup

#%%constants
DIR_PATH:str = os.path.dirname(os.path.realpath(__file__)) + "/"    #get absolute path to current file
CONFIG:dict = load_config(f"{DIR_PATH}../../config.json")
PROJECTPATH:str = CONFIG["projectpath"]
DATADIR:str = PROJECTPATH + "data/"
GFXDIR:str = PROJECTPATH + "outputs/gfx/"

#%%definitions

#%%main
def main():
    global DIR_PATH
    global PROJ_PATHS

    print(DIR_PATH)
    print(CONFIG)
    return

if __name__ =="__main__":
    main()
