FROM debian:jessie-slim

# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

ARG BUILD_DATE
ARG BUILD_VERSION
ARG VCS_URL
ARG VCS_REF
ARG VCS_BRANCH

ENV TSSCHECKER_VERSION 212

# See http://label-schema.org/rc1/ and https://microbadger.com/labels
LABEL org.label-schema.name="tsschecker - powerfull tool to check tss signing status" \
    org.label-schema.description="tsschecker installation on Debian Jessie based container" \
    org.label-schema.vendor="Cyconet" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date="${BUILD_DATE:-unknown}" \
    org.label-schema.version="${BUILD_VERSION:-unknown}" \
    org.label-schema.vcs-url="${VCS_URL:-unknown}" \
    org.label-schema.vcs-ref="${VCS_REF:-unknown}" \
    org.label-schema.vcs-branch="${VCS_BRANCH:-unknown}"

RUN apt-get update && apt-get -y upgrade && \
  apt-get -y install --no-install-recommends libcurl3 libusb-1.0-0 ca-certificates && \
  apt-get -y install --no-install-recommends wget unzip && \
  # Pull tsschecker binaries
  wget "https://github.com/tihmstar/tsschecker/releases/download/v${TSSCHECKER_VERSION}/tsschecker_v${TSSCHECKER_VERSION}_mac_win_linux.zip" -O /tmp/tsschecker_v${TSSCHECKER_VERSION}_mac_win_linux.zip && \
  unzip /tmp/tsschecker_v${TSSCHECKER_VERSION}_mac_win_linux.zip -d /tmp/ && \
  mv /tmp/tsschecker_linux /usr/local/bin/tsschecker && \
  chmod +x /usr/local/bin/tsschecker && \
  apt-get -y purge wget unzip && \
  apt-get -y autoremove --purge && \
  rm -rf /var/lib/apt/lists/* /tmp/*

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["tsschecker"]
