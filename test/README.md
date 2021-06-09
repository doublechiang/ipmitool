Demostrate the use of 

# Use the git submodule since we OpenIPMI ipmi_sim to simulate the BMC
git submodule add https://git.code.sf.net/p/openipmi/code openipmi-code

# get the submodule content command
git submodule init
git submodule update

# rqeuired software.
python3
pip install robotframework

# Build and start up the simulate BMC.
./build_sim_bmc.sh 
./run_sim_bmc.sh

The script include call to Robotframework.





