# docker-hla
Dockerfile with FAC High Level Applications

## Docker Installation
Instructions for installing Docker on Ubuntu can be found on this web site: https://docs.docker.com/install/linux/docker-ce/ubuntu/

## sirius-docker-hla script
This script can be used to launch the HLA windows. 
When you issue it for the first time docker will pull the required image (lnlsfac/docker-hla). 
The name of the application must be passed as an argument to the script. 
The available applications are:
    * sirius-hla-as-ps-launcher.py
    * sirius-hla-as-ma-launcher.py
    * sirius-hla-tb-ap-posang.py
    * sirius-hla-ts-ap-posang.py
    * sirius-hla-bo-ap-chromcorr.py
    * sirius-hla-si-ap-chromcorr.py
    * sirius-hla-bo-ap-tunecorr.py
    * sirius-hla-si-ap-tunecorr.py
    * sirius-hla-bo-ap-currlt.py
    * sirius-hla-si-ap-currlt.py
    * sirius-hla-bo-config-manager.py
    * sirius-hla-si-ap-sofb.py

Note that some environment variables must be set correctly depending on the IOC that is serving the HLA application, more specifically:
    * VACA_PREFIX
    * EPICS_CA_AUTO_ADDR_LIST
    * EPIC_CA_ADDR_LIST


