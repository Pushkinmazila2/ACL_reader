FROM ubuntu:24.04

# Отключаем интерактивные диалоги apt
ENV DEBIAN_FRONTEND=noninteractive

# Обновляем систему и устанавливаем утилиты для SMB/CIFS
RUN apt-get update && apt-get install -y \
    samba-client \
    smbclient \
    cifs-utils \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Контейнер будет просто ожидать команд
CMD ["sleep", "infinity"]
