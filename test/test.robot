*** Settings ***
Documentation    Query virtual BMC
Library      OperatingSystem
Library      Process
Library		 BuiltIn
Library      String


*** Variables ***
${BMCIP}	localhost
${USER}		ipmiusr
${PASS}		test
${PORT}     9001
${EXEC}     ../src/ipmitool
${simdir}  ${CURDIR}${/}..${/}openipmi-code${/}lanserv



*** Test Cases ***
Query mc info
    [Documentation]     Run ipmitool mc info should get resposne with string Firmware Revision
    # Run Process     ${EXEC} -I lanplus -U ${BMCIP} -P test -p 9001 -H localhost mc info     alias=ipmitool
    # Get result object
    ${result}=  run     ${EXEC} -I lanplus -U ${USER} -P ${PASS} -p ${PORT} -H ${BMCIP} mc info
    log     ${result}
    Should Contain      ${result}   Firmware Revision

*** Keywords ***
Start Sim
    # Start Process       ${simdir}/ipmi_sim ${simdir}/lan.conf -f ${simdir}/ipmisim1.emu -s ${simdir}/my_statedir
    ${simhandle}=   Start Process       ${simdir}/ipmi_sim      ${simdir}/lan.conf -f ${simdir}/ipmisim1.emu -s ${simdir}/my_statedir -n   cwd=${simdir}
    log     ${simhandle}

Stop Sim
    Terminate Process

