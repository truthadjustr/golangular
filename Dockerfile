FROM node:latest

ENV GOPATH=/root/go/
ENV PATH=/usr/local/go/bin:/root/go/bin:$PATH

RUN printf "\n*** golangular ***\n" >> /root/.bashrc \
    && apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https vim netcat socat net-tools tcpdump vifm xmlstarlet jq unzip less \
    && mkdir -p /root/go/{src,pkg,bin} \
    && mkdir /root/src/ \
    && wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.9.3.linux-amd64.tar.gz \
    && rm -f go1.9.3.linux-amd64.tar.gz \
    && npm install -g @angular/cli@latest --unsafe \
    && npm install -g gulp \
    && npm install -g typescript \
    && npm install -g yarn

WORKDIR /root/
