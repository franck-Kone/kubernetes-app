FROM centos:latest
RUN yum install -y httpd \
zip\
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page253/estateagency.zip /var/www/html
WORKDIR /var/www/html
RUN unzip estateagency.zip
RUN cp -rvf estateagency/* .
RUN rm -rf estateagency.zip estateagency
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
EXPOSE 80 22

