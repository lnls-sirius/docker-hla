#!/bin/bash

if [ -z $1 ]; then
  echo 'Usage: sirius-hla-docker.sh AppName'
  echo 'Applications:'
  echo '  as-ma-launcher'
  echo '  as-ps-launcher'
  echo '  tb-ap-posang'
  echo '  bo-ap-chromcorr'
  echo '  bo-ap-currlt'
  echo '  bo-ap-tunecorr'
  echo '  bo-ap-confmgr'
  echo '  bo-ap-ramp'
  echo '  ts-ap-posang'
  echo '  si-ap-chromcorr'
  echo '  si-ap-currlt'
  echo '  si-ap-sofb'
  echo '  si-ap-tunecorr'
  exit 1
fi

# EPICS_CA_AUTO_ADDR_LIST=NO
# EPICS_CA_ADDR_LIST="10.0.21.255 10.0.38.22 10.0.38.38 10.0.38.39 10.0.38.40"

export HLA=sirius-hla-$1.py

echo 'Running Docker'
echo "VACA_PREFIX=$VACA_PREFIX"
echo "EPICS_CA_ADDR_LIST=$EPICS_CA_ADDR_LIST"
echo "HLA=$HLA"

docker run --network=host -it --rm -e DISPLAY=$DISPLAY -e VACA_PREFIX=$VACA_PREFIX -e EPICA_CA_AUTO_ADDR_LIST=$EPICS_CA_AUTO_ADDR_LIST -e EPICS_CA_ADDR_LIST="$EPICS_CA_ADDR_LIST" -v /tmp/.X11-unix:/tmp/.X11-unix lnlsfac/docker-hla /bin/bash -c $HLA

exit 0
