###
#
# A simple container for running one-off composer commands
#
###
FROM php:5.6-cli
MAINTAINER Kingsquare <docker@kingsquare.nl>

# Set composer home
VOLUME ["/app"]
WORKDIR /app
ENV COMPOSER_HOME /root/composer

# Install dependencies and perform cleanup
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	apt-get install -qy --no-install-recommends zlib1g-dev libmcrypt-dev git && \
	apt-get autoremove -yq --purge && \
	rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* && \
	docker-php-ext-install mcrypt && \
	docker-php-ext-install zip && \
	docker-php-ext-install mbstring

# Install Composer && run
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENTRYPOINT ["composer", "--ansi"]