FROM ubuntu:16.04

COPY ./install.sh /root/
RUN bash /root/install.sh
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

ENTRYPOINT ["/bin/zsh"]
