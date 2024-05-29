FROM centos:7


# Update the package list and install unzip
RUN yum update -y
RUN yum install unzip -y
RUN yum install wget -y
RUN mkdir /var/www /var/www/html

#RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip -O /home/ubuntu/little-fashion.zip
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip -O /tmp/little-fashion.zip && \
    unzip /tmp/little-fashion.zip -d /var/www/html

# Clean up
#RUN rm /tmp/little-fashion.zip


#WORKDIR /home/ubuntu
# RUN unzip little-fashion.zip 
# RUN  cp -r little-fashion/2127_little_fashion/* /var/www/html

# RUN rm -rf litte-fashion.zip little-fashion
EXPOSE 80
RUN curl -uadmin:AP8gcgmmset5jeYChTJYDN6XmDd -T /var/www/html/* http://100.26.247.192:8081/artifactory/kube-project/package1.zip

CMD [ "/var/www/html", "-D", "FOREGROUND" ]

