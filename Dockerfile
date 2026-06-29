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
    
# Генерируем русскую локаль UTF-8
RUN locale-gen ru_RU.UTF-8

# Устанавливаем системные переменные окружения для поддержки UTF-8
ENV LANG=ru_RU.UTF-8
ENV LANGUAGE=ru_RU:ru
ENV LC_ALL=ru_RU.UTF-8

# Рабочая директория
WORKDIR /app

# Контейнер будет просто ожидать команд
CMD ["sleep", "infinity"]
