FROM alpine:latest
MAINTAINER Peter Borsa <peter.borsa@gmail.com>
LABEL Description="A Docker image to build various Drupal sites" Vendor="asrob"

RUN apk --update add \
  curl \
  git \
  nodejs \
  nodejs-npm \
  php7 \
  php7-bcmath \
  php7-bz2 \
  php7-curl \
  php7-gd \
  php7-iconv \
  php7-intl \
  php7-json \
  php7-mbstring \
  php7-mcrypt \
  php7-opcache \
  php7-openssl \
  php7-pear \
  php7-phar \
  php7-xml \
  php7-zlib \
  python3 \
  sed \
  tar \
  unzip \
  wget \
  which \
  xz \
  zip \
  && rm /var/cache/apk/* \
  && npm install -g grunt-cli gulp-cli \
  && sed -i "s|;*memory_limit =.*|memory_limit = 2G|i" /etc/php7/php.ini \
  && sed -i "s|;*max_execution_time =.*|max_execution_time = 300|i" /etc/php7/php.ini \
  && sed -i "s|;*date.timezone =.*|date.timezone = Europe\/Budapest|i" /etc/php7/php.ini \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
  && curl -o /usr/bin/drush https://github.com/drush-ops/drush/releases/download/8.1.12/drush.phar \
  && chmod +x /usr/bin/drush 
