Demostrate the use of 

# Use the git submodule since we OpenIPMI ipmi_sim to simulate the BMC
git submodule add https://git.code.sf.net/p/openipmi/code openipmi-code

## get the submodule command
git submodule init
git submodule update

# Build and start up the simulate BMC.
mkdir my_statedir
./ipmi_sim lan.conf -f ipmisim1.emu -s my_statedir <<< quit
## initialzie the BMC whateve.

run the
./ipmi_sim lan.conf -f ipmisim1.emu -s my_statedir &

# Use Robotframework to test the compiled image.
## Pre-requements
python3
pip install robotframework




