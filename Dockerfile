FROM newrelic/nrsysmond:2.3.0.132
MAINTAINER Lumos Labs <ops@lumoslabs.com>

ENV TINI_VERSION=v0.10.0 CONFIG_PATH=/data/newrelic/config
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /sbin/tini
ADD container-run /sbin/
RUN chmod +x /sbin/tini /sbin/container-run
ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["/sbin/container-run"]
