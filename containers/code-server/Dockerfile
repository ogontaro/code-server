FROM codercom/code-server:3.4.1

USER root

ENV LANG="C.UTF-8" \
    TZ="Asia/Tokyo"
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt update && \
    apt install -y --no-install-recommends build-essential wget curl apt-transport-https ca-certificates gnupg-agent software-properties-common gnupg && \
    apt clean && \
    rm -r /var/lib/apt/lists/*
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update -y && sudo apt-get install -y docker-ce docker-ce-cli containerd.io
RUN curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose && ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

COPY docker-entrypoint.sh /tmp
RUN chown coder:coder /tmp/docker-entrypoint.sh

COPY extension /init/
RUN find /init -name *.sh | xargs sh

USER coder
RUN mkdir -p ~/.local/share/code-server

ENTRYPOINT ["/tmp/docker-entrypoint.sh"]
