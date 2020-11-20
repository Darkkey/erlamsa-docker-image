FROM alpine

RUN apk add git erlang make erlang-dev
RUN mkdir -p /opt && cd /opt && git clone https://github.com/Darkkey/erlamsa && cd /opt/erlamsa && echo -n > /opt/erlamsa/src/dependencies.hrl && cp rebar.config.win rebar.config && echo -n '' > src/version.hrl && escript rebar3.win compile eunit && escript script-builder
RUN echo "#!/bin/sh" > /opt/erlamsa-service && echo "/opt/erlamsa/erlamsa -H 0.0.0.0:17771 -L -" >> /opt/erlamsa-service && chmod +x /opt/erlamsa-service

EXPOSE 17771

ENTRYPOINT ["/opt/erlamsa-service"]
