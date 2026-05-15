# InnovaTech - Backend Despacho (Rama Deploy)

Este repositorio contiene la lógica de servidor para el sistema de gestión de logística y despachos de InnovaTech. La rama `deploy` contiene la versión estable y configurada para su puesta en marcha en entornos de producción.

## Descripción del Sistema

El backend actúa como el núcleo de operaciones para la gestión de entregas, permitiendo la administración de pedidos, asignación de transportistas y el seguimiento de estados de envío. Está diseñado para ser escalable y asegurar la integridad de los datos logísticos.

## Requisitos Previos

* Node.js (versión LTS recomendada)
* Gestor de paquetes npm o yarn
* Acceso a una instancia de base de datos (MongoDB/PostgreSQL según configuración)

## Instalación

1. Clonar el repositorio:
`git clone https://github.com/puliv/innovatech-backend-despacho`
2. Acceder a la rama de despliegue:
`git checkout deploy`
3. Instalar las dependencias de producción:
`npm install --production`

## Configuración

Es necesario crear un archivo `.env` en el directorio raíz. Las variables mínimas requeridas son:

* `PORT`: Puerto en el que correrá el servidor.
* `DATABASE_URL`: Cadena de conexión a la base de datos.
* `JWT_SECRET`: Clave para la firma de tokens de autenticación.
* `NODE_ENV`: Debe establecerse como `production`.

## Uso y Ejecución

Para iniciar el servicio en el entorno de producción, utilice los siguientes comandos:

1. **Compilación (si el proyecto usa TypeScript):**
`npm run build`
2. **Inicio del servicio:**
`npm start`
3. **Ejecución en segundo plano (Recomendado):**
Si utiliza PM2: `pm2 start dist/main.js --name backend-despacho`

## Estructura de la API

El proyecto expone los siguientes módulos principales:

* **Autenticación:** Control de acceso y roles para operarios y repartidores.
* **Despachos:** Gestión del ciclo de vida de los pedidos (creación, asignación, entrega).
* **Inventario/Productos:** Consulta de disponibilidad para despacho.
* **Usuarios:** Administración de perfiles de personal logístico.
