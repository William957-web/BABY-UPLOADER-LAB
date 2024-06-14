FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update && apt-get install -y \
    php5 \
    php5-mysql \
    php5-curl \
    php5-json \
    php5-cli \
    php5-gd \
    php5-mcrypt \
    php5-xmlrpc \
    php5-xsl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY . /var/www/html
RUN rm /var/www/html/Dockerfile
RUN chmod 777 -R /var/www/
RUN mkdir /var/www/html/uploads
RUN chmod 777 /var/www/html/uploads
RUN useradd -m -d /home/icedtea -s /bin/bash icedtea
RUN echo 'ICED{My_First_RC3_with_file_uploading}' > /home/icedtea/user.txt
RUN echo 'ICED{Priv_Sec_fiNding!!!}' > /root/root.txt
RUN chmod u+s /usr/bin/find && chmod g+s /usr/bin/find && chmod o+s /usr/bin/find
EXPOSE 80

# 啟動 PHP 內建的 Web 伺服器
CMD ["bash", "-c", "su - icedtea -c 'php -S 0.0.0.0:80'"]
