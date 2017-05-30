FROM alpine:latest

# Install OS dependencies + AWS CLI.
RUN \
  apk -Uuv add groff less python py-pip curl && \
  pip install awscli && \
	apk --purge -v del py-pip && \
  rm -rf /var/cache/apk/*

# Install the Flynn CLI.
RUN L=/usr/local/bin/flynn && curl -sSL -A "`uname -sp`" https://dl.flynn.io/cli | zcat >$L && chmod +x $L

# Copy shell files.
COPY *.sh /root/

WORKDIR /root
ENTRYPOINT sh waiter.sh
