FROM newrelic/nrsysmond:2.3.0.132
MAINTAINER Lumos Labs <ops@lumoslabs.com>

ENV TINI_VERSION=v0.10.0 CONFIG_PATH=/data/newrelic/config
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /sbin/tini
ADD kube-run /sbin/
RUN chmod +x /sbin/tini /sbin/kube-run
ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["/sbin/kube-run"]
