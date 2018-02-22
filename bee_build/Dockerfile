FROM golang:1.8
ARG PROXY 
ARG USER_ID
ENV http_proxy $PROXY
ENV https_proxy $PROXY
RUN apt-get update && apt-get install -y sudo

RUN export uid=$USER_ID && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:0:developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:0 -R /home/developer
ENV GOPATH /home/developer/go
ENV PATH /home/developer/go/bin:/usr/local/go/bin:$PATH
USER developer
RUN mkdir /home/developer/go
RUN chown ${uid}:0 -R /home/developer/go
RUN go get -u github.com/beego/bee && \
    go get -u github.com/astaxie/beego
WORKDIR $GOPATH