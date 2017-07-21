FROM alpine:latest
MAINTAINER Peter Borsa <peter.borsa@gmail.com>
LABEL Description="A Docker image to build various Drupal sites" Vendor="asrob"

RUN apk --update add \
  curl \
  git \
  nodejs \
  nodejs-npm \
  openssh \
  php7 \
  php7-bcmath \
  php7-bz2 \
  php7-common \
  php7-ctype \
  php7-curl \
  php7-exif \
  php7-fileinfo \
  php7-gd \
  php7-gettext \
  php7-iconv \
  php7-intl \
  php7-json \
  php7-mbstring \
  php7-mcrypt \
  php7-mysqlnd \
  php7-opcache \
  php7-openssl \
  php7-pcntl \
  php7-pdo \
  php7-pdo_mysql \
  php7-pear \
  php7-phar \
  php7-recode \
  php7-session \
  php7-simplexml \
  php7-soap \
  php7-sockets \
  php7-xml \
  php7-zip \
  php7-zlib \
  python3 \
  rsync \
  sed \
  tar \
  unzip \
  wget \
  which \
  xz \
  zip \
  && rm /var/cache/apk/* \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && npm install -g grunt-cli gulp-cli \
  && sed -i "s|;*memory_limit =.*|memory_limit = 2G|i" /etc/php7/php.ini \
  && sed -i "s|;*max_execution_time =.*|max_execution_time = 300|i" /etc/php7/php.ini \
  && sed -i "s|;*date.timezone =.*|date.timezone = Europe\/Budapest|i" /etc/php7/php.ini \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
  && curl -L -o /usr/bin/drush https://github.com/drush-ops/drush/releases/download/8.1.12/drush.phar \
  && chmod +x /usr/bin/drush 
