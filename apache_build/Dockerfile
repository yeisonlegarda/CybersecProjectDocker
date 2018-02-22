FROM httpd:2.4
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
RUN chown -R  developer /usr/local/apache2/htdocs/
USER developer
