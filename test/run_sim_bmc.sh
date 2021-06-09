#!/bin/bash

# Build the ipmi_sim & lanserv
simdir=../openipmi-code/lanserv
mkdir -p ${simdir}/my_statedir
${simdir}/ipmi_sim ${simdir}/lan.conf -f ${simdir}/ipmisim1.emu -s ${simdir}/my_statedir <<< quit

# Install SDR into state directory
cp ${simdir}/ipmisim1.bsdr ${simdir}/my_statedir/ipmi_sim/ipmisim1/sdr.20.main
${simdir}/ipmi_sim ${simdir}/lan.conf -f ${simdir}/ipmisim1.emu -s ${simdir}/my_statedir -n &
simpid=`echo $!`

robot test.robot
kill -9 $simpid
