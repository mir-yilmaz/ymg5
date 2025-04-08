FROM nginx:latest

# Aynı klasördeki index.html dosyasını Nginx'e kopyala
COPY ./index.html /usr/share/nginx/html/index.html

EXPOSE 80
