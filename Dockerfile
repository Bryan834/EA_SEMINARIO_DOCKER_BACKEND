# Imagen base oficial de Node.js
FROM node:20

# Instalar Git (necesario para clonar el repositorio)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Variables del repositorio (recibidas desde docker-compose.yml)
ARG GIT_REPO
ARG GIT_BRANCH

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Clonar la rama indicada del repositorio
RUN git clone --branch ${GIT_BRANCH} ${GIT_REPO} .

# Instalar dependencias
RUN npm install

# Compilar TypeScript a JavaScript
RUN npm run build

# Exponer el puerto del backend
EXPOSE 3000

# Comando para arrancar el servidor compilado
CMD ["node", "dist/index.js"]
