FROM alpine:latest
MAINTAINER Peter Borsa <peter.borsa@gmail.com>
LABEL Description="A Docker image to build various Drupal sites" Vendor="asrob"

RUN apk --update add \
  curl \
  git \
  nodejs \
  php7 \
  php7-bcmath \
  php7-curl \
  php7-gd \
  php7-iconv \
  php7-intl \
  php7-json \
  php7-mbstring \
  php7-mcrypt \
  php7-opcache \
  php7-openssl \
  php7-phar \
  php7-xml \
  python3 \
  sed \
  tar \
  unzip \
  wget \
  which \
  xz \
  zip \
  && npm install -g grunt-cli gulp-cli \
  && sed -i "s|;*memory_limit =.*|memory_limit = 2G|i" /etc/php.ini \
  && sed -i "s|;*max_execution_time =.*|max_execution_time = 300|i" /etc/php.ini \
  && sed -i "s|;*date.timezone =.*|date.timezone = Europe\/Budapest|i" /etc/php.ini \
  && ln -s /usr/bin/php7 /usr/bin/php \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
  && curl -o /usr/bin/drush https://github.com/drush-ops/drush/releases/download/8.1.12/drush.phar \
  && chmod +x /usr/bin/drush 
