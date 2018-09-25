#!/bin/bash

if [ -z $1 ]; then
	echo 'Usage: sirius-hla-docker.sh AppName'
	echo 'Applications:'
  echo '  as-ma-launcher.py'
	echo '  as-ps-launcher.py'
	echo '  tb-ap-posang.py'
  echo '  bo-ap-chromcorr.py'
  echo '  bo-ap-currlt.py'
  echo '  bo-ap-tunecorr.py'
  echo '  bo-ap-confmgr.py'
  echo '  bo-ap-ramp.py'
	echo '  ts-ap-posang.py'
	echo '  si-ap-chromcorr.py'
  echo '  si-ap-currlt.py'
  echo '  si-ap-sofb.py'
	echo '  si-ap-tunecorr.py'
	exit 1
fi

# EPICS_CA_AUTO_ADDR_LIST=NO
# EPICS_CA_ADDR_LIST="10.0.21.255 10.0.38.22 10.0.38.38 10.0.38.39 10.0.38.40"

echo 'Running Docker'
echo "VACA_PREFIX=$VACA_PREFIX"
echo "EPICS_CA_ADDR_LIST=$EPICS_CA_ADDR_LIST"
echo "HLA=sirius-hla-$1"

docker run --network=host -it --rm -e DISPLAY=$DISPLAY -e VACA_PREFIX=$VACA_PREFIX -e EPICA_CA_AUTO_ADDR_LIST=$EPICS_CA_AUTO_ADDR_LIST -e EPICS_CA_ADDR_LIST="$EPICS_CA_ADDR_LIST" -v /tmp/.X11-unix:/tmp/.X11-unix lnlsfac/docker-hla /bin/bash -c $1

exit 0
