# Instalador_SIPp

Shell Script para instalar SIPp y sus dependencias en Ubuntu 16.04.

Cuando uno instala SIPp por primera vez, se da cuenta que tiene varias dependencias, y puede ser frustrante hacerlo si falla en el camino.

Con este script, lo realizarás mientras te tomas un café.

**Instrucciones**

   1. Copiar el script en la carpeta home
   2. Dar permisos de ejecución al script:
      sudo chmod +x sipp_install.sh 
   3. Desde el directorio home, ejecutar el script:
      sudo ./sipp_full_install.sh 
   4. Tomarse un café mientras se instalan las dependencias y SIPp en el directorio /opt/sipp3-3
   5. Se creará un link simbólico hacia /usr/local/bin para que así se pueda correr SIPp desde cualquier directorio 
   6. Por último, se clonarán algunos escenarios de prueba para hacer llamadas en el directorio /opt/sipp3-3/sipp-scenarios del repo: https://github.com/saghul/sipp-scenarios

