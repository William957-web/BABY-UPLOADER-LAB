FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y software-properties-common php php-cli 
    && apt-get clean 
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
USER icedtea
EXPOSE 80

# 啟動 PHP 內建的 Web 伺服器
CMD ["php", "-S", "0.0.0.0:80"]
