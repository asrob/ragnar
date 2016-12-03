FROM fedora:rawhide
MAINTAINER Peter Borsa <peter.borsa@integralvision.hu>
LABEL Description="A basic Docker image to build various Drupal sites" Vendor="Integral Vision"

RUN echo "deltarpm=False" >> /etc/dnf/dnf.conf \
  && dnf clean all \
  && dnf upgrade -y \
  && dnf install -y composer gcc git nodejs php-cli php-bcmath php-curl php-gd php-intl php-mbstring \
  php-mcrypt php-opcache php-xml rpm-build ruby ruby-devel rubygems-devel unzip wget zip \
  && php -r "readfile('http://files.drush.org/drush.phar');" > drush && chmod +x drush && mv drush /usr/local/bin \
  && npm install -g grunt-cli gulp-cli \
  && gem update --system \
  && gem install compass \
  && sed -i "s|;*memory_limit =.*|memory_limit = 2G|i" /etc/php.ini \
  && sed -i "s|;*max_execution_time =.*|max_execution_time = 300|i" /etc/php.ini \
  && sed -i "s|;*date.timezone =.*|date.timezone = Europe\/Budapest|i" /etc/php.ini \
  && dnf remove -y gcc rpm-build ruby-devel rubygems-devel