#  Imagen base oficial de Node.js
FROM node:20

#  Directorio de trabajo dentro del contenedor
WORKDIR /app

#  Copiar los archivos de dependencias
COPY package*.json ./

#  Instalar dependencias
RUN npm install

#  Copiar el resto del código del backend
COPY . .

#  Compilar TypeScript a JavaScript
RUN npm run build

#  Exponer el puerto (ajústalo si tu backend usa otro)
EXPOSE 3000

#  Comando para arrancar el servidor compilado
CMD ["node", "dist/index.js"]
