#!/bin/bash
source code.conf
echo "Deteniendo los contenedores si estan en ejecucion..."
USER_ID=$UID docker-compose down
echo "Entorno de Desarrollo"
echo "Creacion de carpetas necesarias del contenedor..."
if [ -f workspace/ ]; then
    echo "Las Carpetas ya fueron creadas..."
else
    mkdir -p workspace/angular
    echo "Carpetas creadas..."
fi
echo "Construyendo Contendor..."
USER_ID=$UID docker-compose build
echo "ejecutando contenedor..."
USER_ID=$UID docker-compose up -d
echo "ejecutando contenedor..."
echo "El contenedor se esta ejecutando en segundo plano..."
echo "para ver el log de los servicios utilice los siguientes comandos:"
echo "para el cliente: docker-compose logs -f client"
