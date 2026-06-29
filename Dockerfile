FROM ubuntu:24.04

# Отключаем интерактивные диалоги
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    samba-client \
    smbclient \
    cifs-utils \
    iputils-ping \
    locales \
    && locale-gen ru_RU.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

# Выставляем переменные окружения UTF-8 для всей системы контейнера
ENV LANG=ru_RU.UTF-8
ENV LANGUAGE=ru_RU:ru
ENV LC_ALL=ru_RU.UTF-8

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]
