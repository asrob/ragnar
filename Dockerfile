FROM gliderlabs/alpine:edge
MAINTAINER Peter Borsa <peter.borsa@gmail.com>
LABEL Description="A basic Docker image to build various Drupal sites" Vendor="asrob"

RUN apk add --no-cache git nodejs php7 php7-bcmath php7-curl php7-gd php7-intl php7-mbstring php7-mcrypt php7-xml unzip zip
RUN php -r "readfile('http://files.drush.org/drush.phar');" > drush && chmod +x drush && mv drush /usr/local/bin
RUN npm install -g grunt-cli