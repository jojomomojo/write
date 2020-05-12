FROM letfn/python

USER root

RUN apt update && apt install -y curl

ARG _WRITEFREELY_VERSION=0.12.0

RUN cd /usr/local \
    && curl -sSL -o write.tar.gz https://github.com/writeas/writefreely/releases/download/v${_WRITEFREELY_VERSION}/writefreely_${_WRITEFREELY_VERSION}_linux_amd64.tar.gz \
    && tar xvfz write.tar.gz \
    && rm -f write.tar.gz \
    && chown -R app:app /usr/local/writefreely

USER app

RUN rmdir /usr/local/writefreely/keys

COPY service /service

ENTRYPOINT [ "/tini", "--", "/service" ]
