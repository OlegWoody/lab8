# Використання базового образу Alpine та передача аргументу NGINX_VERSION
ARG NGINX_VERSION=latest
FROM alpine:${NGINX_VERSION} AS base

# Встановлення пакетів Nginx та supervisord
RUN apk add --no-cache nginx supervisor

# Копіювання конфігураційних файлів в образ
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

# Вказання команд, які будуть виконані при старті контейнера
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
