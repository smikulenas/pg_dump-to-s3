FROM ubuntu:18.04

RUN apt-get update && apt-get install --no-install-recommends -y postgresql-client-10 python-pip && \
  pip2 install --upgrade setuptools && \
  pip2 install awscli && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV PGDUMP_OPTIONS -Fc --no-acl --no-owner
ENV PGDUMP_DATABASE **None**

ENV AWS_ACCESS_KEY_ID **None**
ENV AWS_SECRET_ACCESS_KEY **None**
ENV AWS_BUCKET **None**

ENV PREFIX **None**

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
