FROM centos:latest

# Install httpd, zip, and unzip
RUN yum install -y httpd zip unzip 

# Download the zip file to /tmp and move it to the desired location
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip /tmp/little-fashion.zip

# Change working directory
WORKDIR /var/www/html

# Unzip the file and clean up in one layer to reduce image size
RUN unzip /tmp/little-fashion.zip -d /var/www/html \
    && cp -rvf /var/www/html/little-fashion/2127_little_fashion/* /var/www/html/ \
    && rm -rf /tmp/little-fashion.zip /var/www/html/little-fashion

# Expose ports
EXPOSE 80 22

# Start httpd in the foreground
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]

