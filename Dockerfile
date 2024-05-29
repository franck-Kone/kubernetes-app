FROM centos:7-2009-1


# Update the package list and install unzip
RUN dnf check-update && dnf install -y unzip wget

#RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip -O /home/ubuntu/little-fashion.zip
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip -O /tmp/little-fashion.zip && \
    unzip /tmp/little-fashion.zip -d /var/www/html

# Clean up
RUN rm /tmp/little-fashion.zip


#WORKDIR /home/ubuntu
# RUN unzip little-fashion.zip 
# RUN  cp -r little-fashion/2127_little_fashion/* /var/www/html

# RUN rm -rf litte-fashion.zip little-fashion
EXPOSE 80

CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]

