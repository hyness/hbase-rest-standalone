FROM java:7-jre

RUN apt-get update
RUN apt-get -y install supervisor python-pip
RUN pip install supervisor-stdout

WORKDIR /opt
RUN curl -O http://ftp.wayne.edu/apache/hbase/hbase-1.0.1/hbase-1.0.1-bin.tar.gz
RUN tar -zvxf hbase-1.0.1-bin.tar.gz

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY hbase-site.xml /opt/hbase-1.0.1/hbase-site.xml

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV PATH $PATH:/opt/hbase-1.0.1/bin

EXPOSE 2181 8080 16000 16010 16020 16030
CMD ["/usr/bin/supervisord"]