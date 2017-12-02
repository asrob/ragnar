FROM alpine:3.6
LABEL maintainer="Peter Borsa <peter.borsa@gmail.com>" 
LABEL description="A minimal Docker image to build various Drupal projects."
LABEL vendor="asrob"
RUN apk --update --no-cache add \
  build-base \
  curl \
  git \
  libffi-dev \
  nodejs \
  nodejs-npm \
  openssh \
  php5 \
  php5-bcmath \
  php5-bz2 \
  php5-common \
  php5-ctype \
  php5-curl \
  php5-cli \
  php5-dom \
  php5-exif \
  php5-gd \
  php5-gettext \
  php5-iconv \
  php5-intl \
  php5-json \
  php5-mcrypt \
  php5-mysql \
  php5-opcache \
  php5-openssl \
  php5-pcntl \
  php5-pdo \
  php5-pdo_mysql \
  php5-pear \
  php5-phar \
  php5-soap \
  php5-sockets \
  php5-xml \
  php5-zip \
  php5-zlib \
  python3 \
  rsync \
  ruby \
  ruby-dev \
  sed \
  tar \
  unzip \
  wget \
  which \
  xz \
  zip \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && ln -s /usr/bin/php5 /usr/bin/php \
  && npm install -g grunt-cli gulp-cli \
  && sed -i "s|;*memory_limit =.*|memory_limit = 4G|i" /etc/php5/php.ini \
  && sed -i "s|;*date.timezone =.*|date.timezone = Europe\/Budapest|i" /etc/php5/php.ini \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
  && curl -L -o /usr/bin/drush https://github.com/drush-ops/drush/releases/download/8.1.15/drush.phar \
  && chmod +x /usr/bin/drush \
  && gem install sass compass --no-ri --no-rdoc \
  && apk del build-base libffi-dev ruby-dev \
  && rm -rf /var/cache/apk/*
