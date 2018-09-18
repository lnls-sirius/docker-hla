#!/bin/bash

if [ -z $1 ]; then
	echo 'Usage: docker-hla.sh AppName'
	echo 'Applications:'
	echo '  sirius-hla-as-ps-launcher.py'
	echo '  sirius-hla-as-ma-launcher.py'
	echo '  sirius-hla-tb-ap-posang.py'
	echo '  sirius-hla-ts-ap-posang.py'
	echo '  sirius-hla-bo-ap-chromcorr.py'
	echo '  sirius-hla-si-ap-chromcorr.py'
	echo '  sirius-hla-bo-ap-tunecorr.py'
	echo '  sirius-hla-si-ap-tunecorr.py'
	echo '  sirius-hla-bo-ap-currlt.py'
	echo '  sirius-hla-si-ap-currlt.py'
	echo '  sirius-hla-bo-config-manager.py'
	echo '  sirius-hla-si-ap-sofb.py'
	exit 1
fi

# EPICS_CA_AUTO_ADDR_LIST=NO
# EPICS_CA_ADDR_LIST="10.0.21.255 10.0.38.22 10.0.38.38 10.0.38.39 10.0.38.40"

echo 'Running Docker'
echo "VACA_PREFIX=$VACA_PREFIX"
echo "EPICS_CA_ADDR_LIST=$EPICS_CA_ADDR_LIST"
echo "HLA=$1"

docker run --network=host -it --rm -e DISPLAY=$DISPLAY -e VACA_PREFIX=$VACA_PREFIX -e EPICA_CA_AUTO_ADDR_LIST=$EPICS_CA_AUTO_ADDR_LIST -e EPICS_CA_ADDR_LIST="$EPICS_CA_ADDR_LIST" -v /tmp/.X11-unix:/tmp/.X11-unix lnlsfac/docker-hla /bin/bash -c $1

exit 0
