Requisitos:

    - Docker
    - Docker compose
Preparación:

    Agregar al usuario del host al grupo docker
        - Comando: sudo gpasswd -a $USER docker
    Dar permisos de ejecución al archivo start.sh y clean.sh *si lo necesita*

Configuracion:
    
    Este contenedor tiene las imagenes de go 1.8 y OAS Generator (Angular 1.6.X). Este deberia funcionar con la arquitectura CRUD api, MID api y cliente. A demas cuenta con una base de datos postgres y apache para comprobar el build del clente.

    Por defecto apache corre en el puerto 80 y postgres en el 5432, esto puede cambiarse en el archivo docker-compose.yml

    La base de datos se crea a partir de un backup en la carpeta bkup, este debe tener la extension .backup

    El archivo code.conf es donde se ponen repos y ramas para el clonado del workspace del contenedor. Por otra parte en este archivo tambien se puede definir los nombres de usuario, base de datos y password de la base de datos que el contenedor monta 

    Las variables de etorno de los apis se pueden generar en un archivo .env_secret.env en la raiz del repositorio

    Si se deseaapuntar a alguno de los servicios del contenedor desde los apis no se debe colocar direccion localhost o 127.0.0.1,encambio se debe poner crud, mid, client o postgresdb  

Posibles Problemas y Soluciones :

    En caso de que las imagenes generen errores de espacio en memoria (ENOESPC, No space left) se recomienda que al correr el contenedor se cierren los editores de texto abiertos.

    En caso de que la base de datos no suba el backup se recomienda que el nombre de usuario dela base de datos en elarchivo code.conf coincida con el nombre de usuario con el que se realizo el backup

Ejecutar EL contenedor:

    -Si se ejecuta por primera vez o si se desea limpiar la base de datos se debe ejecutar el archivo clean.sh
    -Si se desea ejecutar el contenedor ya habiendo creado la base de datos se debe ejecutar elarchivo start.sh 


Ver logs de los servicios y cliente:

    - CLIENT_PORT=$CLIENT_PORT CRUD_PORT=$CRUD_PORT MID_PORT=$MID_PORT docker-compose logs -f client
    - CLIENT_PORT=$CLIENT_PORT CRUD_PORT=$CRUD_PORT MID_PORT=$MID_PORT docker-compose logs -f mid
    - CLIENT_PORT=$CLIENT_PORT CRUD_PORT=$CRUD_PORT MID_PORT=$MID_PORT docker-compose logs -f crud

Utilizar las herramientas bee, go, node, npm, generador oas desde el contenedor

    - CLIENT_PORT=$CLIENT_PORT CRUD_PORT=$CRUD_PORT MID_PORT=$MID_PORT docker-compose exec client /bin/bash (abre consola sobre la carpeta angular con las herramientas node, npm, generador oas)
    - CLIENT_PORT=$CLIENT_PORT CRUD_PORT=$CRUD_PORT MID_PORT=$MID_PORT docker-compose exec mid /bin/bash (abre consola sobre la carpeta go con las herraminetas go , bee)
    - CLIENT_PORT=$CLIENT_PORT CRUD_PORT=$CRUD_PORT MID_PORT=$MID_PORT docker-compose exec crud /bin/bash (abre consola sobre la carpeta go con las herraminetas go , bee)

    REEMPLAZAR LAS VARIABLES $ POR CUALQUIER PUERTO

bajar los servicios:

    - CLIENT_PORT=$CLIENT_PORT CRUD_PORT=$CRUD_PORT MID_PORT=$MID_PORT docker-compose down