# Registro de Hoteles

Crud en laravel + React para ingresar datos de hoteles, como información básica y además sus tipos de habitaciones que ofrecen.


### Pre-requisitos 📋


_Instalar Composer_

Se requiere este paquete de instalación que nos facilita la instalación de Laravel, ya que desde su linea de comandos (CLI) se gestionará este proceso.
Link de Instalación:
```
https://getcomposer.org/doc/00-intro.md
```

_Instalar WampServer o Xampp_

Se requiere un programa que genere un servidor local, recomendamos alguno de estos dos, pero puede ser el que más desee. Con este programa, instalaremos Apache,
como servidor, y PHP, que son herramientas que permitiran la conexión de nuestro aplicativo desde la base de datos hacia el backend y posteriormente al frontend.
Si ya tiene alguno instalado, asegurese de tener la version de PHP superior a 8.0, si no es así, actualice el programa.

_Link Xampp_
```
(https://www.apachefriends.org/docs/)
```
_Link WampServer_ 
```
(https://www.wampserver.com/en/category/documentation-en/)
```

_Instalar Node Js_

Para la parte front vamos a requerir instalar Node Js, esto para poder usar el framework React Js para el Frontend. Se requiere una versión arriba de 16.04.
Link Node JS 
```
(https://nodejs.org/en/download)
```


_Instalar Npm_

Tambien para nuestro Frontend, requerimos del paquete de instalación NPM, en su versión 8.1.2 o superior.
Link para instalación 
```
(https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
```

_Instalar Laravel 9_

Debemos abrir una linea comados, y en esta, ejecutar el sigiente comando
```
composer global require laravel/installer
```
Listo!! Si llega a necesitar ayuda en la instalación, debido a la configuración en su PC, revise la guia de instalación:
```
https://laravel.com/docs/7.x/installation
```


_Instalar Postgresql_

Para este proyecto se instaló la versión 15, el backup de la base de datos esta en esa versión, pero si lo prefiere puede usar la versión de Postgresql
u otro gestor de base de datos que prefiera, solo debe configurar el archivo .ENV, el cuál se explica en este documento.
_Link de instalación_
```
https://laravel.com/docs/7.x/installation
```

_Instalar GIT_

Para poder clonar el repositorio, modificar, y crear versiones, utilizaremos Git y GitHub, para esto es necesario instalarlo de manera local, en el siguiente link podrá seguir el paso a paso para su instalación.
```
https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Instalaci%C3%B3n-de-Git
```


## Instalación 🔧

_Clonar Repositorio_

_Vaya al carpeta donde instaló el software para el servidor Apache_

Para Xampp seria:
```
C:\xampp\htdocs
```
Para WampServer:
```
C:\wamp64\www
```
_Abrimos una terminal de comandos o CMD, luego en ella, clonamos el repositorio con la siguiente instrucción_
```
git clone https://github.com/brian623/poryectoHoteles.git
```
_Allí quedarán todos los archivos de nuestro aplicativo, junto con el backup de la base de datos_
_Abra pgAdmin4, para gestionar la base de datos, en la carpeta BD de nuestro proyecto, encontrará un archivo llamado "crud_hotels.sql", este es el backup_
_En pgAdmin vamos a crear la BD así:_

![image](https://user-images.githubusercontent.com/48931107/228146539-7f51bae5-832a-463e-a968-92af656431e4.png)

![image](https://user-images.githubusercontent.com/48931107/228150109-569483ad-08e0-4afd-a1c4-10c741e9fc38.png)

_Ya creada la base de datos, procedemos a restaurarla de la siguiente forma:_

![image](https://user-images.githubusercontent.com/48931107/228150308-2ffbf5b3-04c6-4661-a33f-5ce46ba4f1bc.png)

![image](https://user-images.githubusercontent.com/48931107/228149560-5ed86f6a-0118-4633-9ec5-df8c48326f34.png)

_Listo!! Nuestra base datos ya esta restaurada para usar en nuestro proyecto_

#### Instalar dependencias y  ⚙️

_Abrimos una terminal o consola de comandos y ejecutamos:
```
composer instal
npm install
```

#### Configurar conexión entre BD y Laravel ⚙️

_Para configurar la conexión a la base de datos con Laravel, vaya a la carpeta del proyecto y luego a la carpeta crud_hoteles, que es la carpeta con nuestro backend_
_luego abra el arcivo_ .env.example _y le cambiamos el nombre a_ .env 
_luego editará las siguientes lineas, poniendo como contraseña la configurada al momento de instalar_ Postgresql

```
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=crud_hotels
DB_USERNAME=postgres
DB_PASSWORD= **Tu contraseña**
```
_Luego generamos una clave para nuestra_ API_KEY _asi:_
```
php artisan key:generate
```
#### Ejecutar migraciones ⚙️
_Las migraciones son la ejecución que almacena la información a la base de datos, para conectarlas basta con ejecutar el siguiente comando:_
```
php artisan migrate
```

#### Ejecutar API 🔩

_Luego de configurar la base de datos, podemos ejecutar la APIREST creada desde Laravel, para esto, ejecute lo siguiente:_

```
php artisan serve
```


## Despliegue 📦

_Ya con la API ejecutandose, podemos ejecutar nuestro aplicativo web, para esot vaya a la carpeta_ view_hotels _dentro del proyecto y abra una terminal y ejecute:_
```
npm install
```
_Esto instalará las dependencias necesarias para el aplicativo realizado con React, luego para ejecutarlo y abrirlo en el navegador ejecute:_
```
npm start
```
_Abra su navegador y en una pestaña vaya a:_
```
http://localhost:3000/
```
#Todo listo! Ya puedes usar la aplicación!
## Construido con 🛠️


* [PostgreSql] (https://www.postgresql.org/) - Gestor de Bases de Datos
* [ReactJs] (https://es.reactjs.org/) - Framework FrontEnd
* [Laravel] (https://laravel.com/) - Framework Backend


## Autores ✒️

* **Brian Rincón Daza** - ([https://github.com/villanuevand](https://github.com/brian623))


