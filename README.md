# PHP Composer docker container

A dockerized version of [Composer](https://getcomposer.org/) Running is easy peasy:

	docker run -v $(pwd):/app gekkie/composer install

If needed you can update the container with different dependencies via the `docker-php-ext-install [module]` command and commit