#!/bin/bash
#SBATCH --mail-type=NONE #ALL
##SBATCH --mail-user=lukas.steinwender99@gmail.com

#SBATCH --output=./execlogs/%x.out
#SBATCH --error=./execlogs/%x.err

#SBATCH --partition=icg                 #partition to be used
#SBATCH --nodes 1                       #number of nodes to be used
#SBATCH --ntasks=1                      #number of tasks per node
#SBATCH --gpus-per-node=1               #number of gpus to be used per node
#SBATCH --cpus-per-gpu=4                #number of cpus of each gpu to be used
#SBATCH --time=2-00:00:00               #time limit
#SBATCH --job-name=hyperparamsearch     #job name

##print current date
start=$(date +%s)   #start date in seconds
startdate=$(date -u -d "@$start" +%Y-%m-%dT%H:%M:%S)    #format nicely
printf "BASH-INFO: Started at %s\n" $startdate

#julia (needs absolute reference to julia executable)
$HOME/julia-1.10.4/bin/julia --project=~/<path2venv> -t 1 -p 1 < path2file.jl >  #-t ... number of threads #-p ... number of processes

#python
source ~/<path2env>/bash/bin/activate
python3 <path2file.py>
deactivate


##print end of script
finish=$(date +%s)  #end date in seconds
finishdate=$(date -u -d "@$finish" +%Y-%m-%dT%H:%M:%S)  #format nicely

##elapsed time
days="$(($(($finish - $start )) / 86400))"  #elapsed days (convert seconds to days)
duration="$(($finish - $start))"            #get elapsed time in seconds
printf "BASH-INFO: Finished at %s\n" $finishdate
printf "BASH-INFO: Ran from : %s\n" "$startdate to $finishdate"
printf "BASH-INFO: Elapsed time: %s days %s\n" "$days" "$(date -u -d "@$duration" +%H:%M:%S)"

