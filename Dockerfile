FROM fedora:latest
MAINTAINER Peter Borsa <peter.borsa@gmail.com>
LABEL Description="A basic Docker image to build various Drupal sites" Vendor="asrob"

RUN dnf clean all \
  && dnf upgrade -y \
  && dnf install git nodejs php-cli php-bcmath php-curl php-gd php-intl php-mbstring php-mcrypt php-opcache \
  php-xml unzip zip \
  && php -r "readfile('http://files.drush.org/drush.phar');" > drush && chmod +x drush && mv drush /usr/local/bin \
  && npm install -g grunt-cli