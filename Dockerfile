FROM httpd:latest


# Update the package list and install unzip
RUN apt-get update && apt-get install -y unzip

RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip \
&& unzip little-fashion.zip && cp -r little-fashion/2127_little_fashion/* /var/www/html

RUN rm -rf litte-fashion.zip little-fashion
EXPOSE 80

CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]

