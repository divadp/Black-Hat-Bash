FROM wordpress:6.4

# Metadata
LABEL name="p-web-02"
LABEL company="ACME Infinity Servers"

# Variables
ENV WORDPRESS_DB_HOST="c-db-02"
ENV WORDPRESS_DB_USER="wordpress"
ENV WORDPRESS_DB_PASSWORD="wordpress"
ENV WORDPRESS_DB_NAME="wordpress"

COPY fix_buster_repos.sh /tmp/fix_buster_repos.sh
RUN chmod +x /tmp/fix_buster_repos.sh && /tmp/fix_buster_repos.sh

# Install Required Packages
RUN apt-get update -y
RUN apt-get install -y \ 
                    net-tools \
                    socat \
                    iputils-ping \
                    iproute2 \ 
                    cron \
                    lshw \
                    at 

# Copy Files to Lab
ADD files/site /var/www/html

# Post Actions
RUN chown www-data:www-data -R /var/www/html/
