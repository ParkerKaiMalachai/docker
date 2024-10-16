FROM php:8.1-fpm AS builder

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

COPY /app/ /app/

WORKDIR /app

FROM php:8.1-fpm-alpine

COPY --from=builder /app /var/www/html

EXPOSE 80

CMD ["php-fpm"]