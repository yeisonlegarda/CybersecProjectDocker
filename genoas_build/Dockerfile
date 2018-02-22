FROM node:7.10
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
RUN npm install -g grunt-cli bower yo generator-karma generator-oas
RUN echo '{ "allow_root": true }' > /root/.bowerrc
USER developer
RUN git config --global user.name "developer"
RUN git config --global user.email "developer@email.com"
#RUN npm install -g @angular/cli
#installacion del generador oas.

WORKDIR /workspace/angular
