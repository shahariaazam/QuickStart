FROM ubuntu:22.04

# Set timezone
RUN \
    echo "Asia/Dhaka" > /etc/timezone   && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    ln -sf /usr/share/zoneinfo/EET /etc/localtime

# Install basic packages
RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    software-properties-common \
    apt-utils \
    tzdata \
    locales \
    vim \
    htop \
    zip \
    bzip2 \
    wget \
    curl \
    git \
    build-essential \
    subversion \
    poppler-utils \
    sudo && \
    apt-get autoremove -y && \
    apt-get clean all

# Set root password
RUN echo 'root:pass' | chpasswd

# Set locale
RUN \
    locale-gen "en_US"       && \
    locale-gen "en_US.UTF-8" && \
    update-locale LANG=en_US.UTF-8 LANGUAGE=en_US


# Setup PHP
RUN apt-get -y install --no-install-recommends \
    php-cli \
    php-common \
    php-json \
    php-sqlite3 \
    php-curl \
    php-intl \
    php-memcached \
    php-apcu \
    php-xml \
    php-bcmath \
    php-mbstring \
    php-opcache

# Tweak PHP settings
RUN \
    sed -i 's/;date.timezone =/date.timezone = Asia\/Dhaka/g' /etc/php/8.1/cli/php.ini && \
    mkdir -p /var/www /run/php

# Install memcache
RUN \
    apt-get update && apt-get -y install memcached

# Install composer
RUN \
    php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
    php composer-setup.php --install-dir '/usr/local/bin' --filename 'composer' --version 2.0.8 && \
    chmod +x /usr/local/bin/composer                                             && \
    php -r "unlink('composer-setup.php');"
