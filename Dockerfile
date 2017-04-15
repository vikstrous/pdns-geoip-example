FROM ubuntu

ADD pdns.list /etc/apt/sources.list.d/pdns.list
ADD preferences /etc/apt/preferences.d/pdns

RUN apt-get update && \
    apt-get install -y curl && \
    curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y pdns-server pdns-backend-geoip

ADD pdns.conf /etc/powerdns/pdns.conf
ADD zone /etc/powerdns/zone

ENTRYPOINT ["pdns_server"]
