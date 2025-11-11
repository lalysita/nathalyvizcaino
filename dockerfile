# -----------------------------------------------------------------
# 1. USA UNA IMAGEN BASE
# Empezamos desde una imagen oficial de Python (usa una versión específica)
FROM python:3.10-slim

# -----------------------------------------------------------------
# 2. ESTABLECE EL DIRECTORIO DE TRABAJO
# Define el directorio donde se ejecutará el código dentro del contenedor
WORKDIR /app

# -----------------------------------------------------------------
# 3. COPIA E INSTALA DEPENDENCIAS
# Copia solo el archivo de requisitos primero.
# Esto aprovecha la caché de Docker: si no cambias requirements.txt,
# no se volverán a instalar las dependencias cada vez que construyas.
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# -----------------------------------------------------------------
# 4. COPIA EL CÓDIGO FUENTE
# Ahora copia el resto del código de tu proyecto al directorio /app
COPY . .

# -----------------------------------------------------------------
# 5. EXPONE EL PUERTO (si es necesario)
# Informa a Docker que el contenedor escuchará en el puerto 8080.
# Esto es más bien "documentación" para el usuario y para Docker.
EXPOSE 8080

# -----------------------------------------------------------------
# 6. EJECUTA LA APLICACIÓN
# El comando para iniciar la aplicación cuando se lance el contenedor.
CMD ["python", "app.py"]