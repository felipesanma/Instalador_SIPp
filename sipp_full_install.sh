#!/bin/bash

# Autor : Pipe San Martín
# Fecha: 29/04/2021 
# Objetivo: Instalar SIPp en Ubuntu Server 16.04 LTS
# Instrucciones : 
#   1. Copiar el script en la carpeta home
#   2. Dar permisos de ejecución al script
#      sudo chmod +x sipp_install.sh 
#   3. Desde el directorio home, ejecutar el script
#      sudo ./sipp_full_install.sh 
#   4. Tomarse un café mientras se instalan las dependencias y SIPp
#   5. Se creará un link simbólico para que así se pueda correr SIPp desde cualquier directorio 
#   6. Por último, se clonarán algunos escenarios de prueba para hacer llamadas del repo: https://github.com/saghul/sipp-scenarios

#fail on errors
set -eu -o pipefail 

sudo -n true
test $? -eq 0 || exit 1 "Necesitas privilegios de superusuario para ejecutarlo!"

echo !!! Actualizando paquetes !!! 

sudo apt-get update 

echo !!!Instalando los pre-requisitos para sipp3.3 !!!

while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
    openssl
    libssl-dev
    libssl1.0.0
    pcaputils
    libncurses5-dev
    libpcap-dev
    libsctp-dev
    autoconf 
    make
    gcc
    g++
    git 
    bison  
EOF
)

echo !!! Obteniendo los archivos de origen .tar para sipp !!!
sudo wget https://downloads.sourceforge.net/project/sipp/sipp/3.3/sipp-3.3.tar.gz -P /tmp

echo !!! Descomprimiendo en /opt/sipp3-3 !!!
tar -xzvf /tmp/sipp-3.3.tar.gz --directory /opt

echo !!! Cambiando directorios !!!
cd /opt/sipp-3.3

echo !!! Ejecutando make !!! 
autoreconf -ivf; ./configure --with-pcap --with-sctp; make

echo !!! SIPp está instalado, creando un link simbólico !!! 
sudo ln -s /opt/sipp-3.3/sipp /usr/local/bin/sipp 

echo !!! Clonando los escenarios de ejemplo !!!
git clone https://github.com/saghul/sipp-scenarios

echo !!! Ahora puedes ejecutar SIPp con "sudo sipp" desde cualquier directorio!!! 

