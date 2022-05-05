FROM ghcr.io/maymeow/php-ci-cd/php-ci-cd:8.0.17-cs-git

# arguments in docker-compose file
ARG user=vscode
ARG uid=1000

RUN echo "memory_limit=1024M" >> /usr/local/etc/php/conf.d/docker-php-memory-limit.ini

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

USER $user

RUN git clone https://github.com/cakephp/upgrade.git /home/$user/tool && \
    cd /home/$user/tool && \
    git checkout master && \
    composer install --no-dev

WORKDIR /home/$user/tool
