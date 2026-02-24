# Usamos la base ligera de Nginx
FROM nginx:alpine

# Eliminamos la configuración por defecto de Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Inyectamos nuestro grimorio de configuración (URLs limpias)
COPY default.conf /etc/nginx/conf.d/

# Copiamos todos los archivos de ludomancer_site al servidor
COPY ./ /usr/share/nginx/html/

# Exponemos el puerto de comunicación
EXPOSE 80

# Mantenemos vivo el proceso
CMD ["nginx", "-g", "daemon off;"]