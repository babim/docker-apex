FROM babim/ubuntubase

ENV DEBIAN_FRONTEND noninteractive
ENV LD_LIBRARY_PATH /instantclient_12_1
ENV USER sys
ENV PASS oracle
ENV HOST oracle-database
ENV PORT 1521
ENV SID XE
ENV HTTP_PORT 8080
ENV APEX_VERSION 5.1.2

RUN apt-get update && apt-get -y install libaio1 unzip wget && apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN wget -q -O /tmp/instantclient-basic-linux.x64-12.1.0.2.0.zip http://media.matmagoc.com/oracle/instantclient-basic-linux.x64-12.1.0.2.0.zip && \
    wget -q -O /tmp/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip http://media.matmagoc.com/oracle/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip && \
    mkdir /apex_$APEX_VERSION/ && \
    wget -q -O apex_$APEX_VERSION.zip-aa http://media.matmagoc.com/oracle/apex_$APEX_VERSION.zip-aa && \
    wget -q -O apex_$APEX_VERSION.zip-ab http://media.matmagoc.com/oracle/apex_$APEX_VERSION.zip-ab
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
