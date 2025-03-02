FROM mcr.microsoft.com/devcontainers/php:8.2

# Install Node.js (20.x LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Laravel CLI
RUN composer global require laravel/installer

# [Optional] Install MySQL client
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y default-mysql-client \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*
