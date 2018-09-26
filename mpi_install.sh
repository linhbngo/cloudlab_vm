#!/bin/bash

wget https://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.3.tar.gz

let trycount=0
while [ ! -e openmpi-1.10.3.tar.gz ] && [ $trycount -lt 3 ]
do
   echo "Failed to download mpi package, trying again..."
   wget https://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-1.10.3.tar.gz
   let trycount=trycount+1
   sleep 1
done

if [ ! -e openmpi-1.10.3.tar.gz ]
then
   echo "Failed to download mpi package after multiple tries, exiting."
   exit 1
fi

tar -xvf openmpi-1.10.3.tar.gz 
rm openmpi-1.10.3.tar.gz
cd openmpi-1.10.3

./configure --prefix="/software/openmpi/1.10.3"
make 
make install

cd ..
rm -rf openmpi-1.10.3
#don't need these - path setting is handled by environment-modules
#echo export PATH="$PATH:/software/openmpi/1.10.3/bin" >> /$HOME/.bashrc
#echo export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/software/openmpi/1.10.3/lib/" >>/etc/environment
