# ������������ �������� ������ Alpine �� �������� ��������� NGINX_VERSION
ARG NGINX_VERSION=latest
FROM alpine:${NGINX_VERSION} AS base

# ������������ ������ Nginx �� supervisord
RUN apk add --no-cache nginx supervisor

# ��������� ��������������� ����� � �����
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

# �������� ������, �� ������ ������� ��� ����� ����������
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
