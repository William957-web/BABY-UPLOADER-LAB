FROM dockerfiles/centos-lamp 

COPY . /var/www/html
RUN rm /var/www/html/Dockerfile
RUN echo 'ICED{My_First_RC3_with_file_uploading}' > /flag-$(xxd -l 6 -p /dev/urandom)
