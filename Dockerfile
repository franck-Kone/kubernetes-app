FROM centos:latest

# Install httpd, zip, and unzip
RUN yum install -y httpd zip unzip && yum clean all

# Download the zip file to /tmp and move it to the desired location
ADD https://www.free-css.com/assets/files/free-css-templates/download/page253/estateagency.zip /tmp/estateagency.zip

# Change working directory
WORKDIR /var/www/html

# Unzip the file and clean up in one layer to reduce image size
RUN unzip /tmp/estateagency.zip -d /var/www/html \
    && cp -rvf /var/www/html/estateagency/* /var/www/html/ \
    && rm -rf /tmp/estateagency.zip /var/www/html/estateagency

# Expose ports
EXPOSE 80 22

# Start httpd in the foreground
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]

