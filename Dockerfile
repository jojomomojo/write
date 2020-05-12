FROM letfn/container AS download

ARG _WRITEFREELY_VERSION=0.12.0

WORKDIR /tmp

#RUN curl -sSL -o write.tar.gz https://github.com/writeas/writefreely/releases/download/v${_WRITEFREELY_VERSION}/writefreely_${_WRITEFREELY_VERSION}_linux_amd64.tar.gz \
#    && tar xvfz write.tar.gz \
#    && rm -f write.tar.gz \
#    && chmod 755 writefreely

COPY write.tar.gz write.tar.gz
RUN tar xfz write.tar.gz

FROM letfn/python

COPY --from=download /tmp/writefreely /usr/local/writefreely

USER root
RUN chown app:app /usr/local/writefreely

USER app

RUN rmdir /usr/local/writefreely/keys

COPY service /service

ENTRYPOINT [ "/tini", "--", "/service" ]
