FROM ubuntu

RUN apt-get update && apt-get install -y git erlang erlang-dev erlang-tools erlang-ssl erlang-eunit erlang-mnesia erlang-inets make
RUN mkdir -p /opt && cd /opt && git clone https://github.com/Darkkey/erlamsa && cd /opt/erlamsa && echo -n > /opt/erlamsa/src/dependencies.hrl && escript rebar get-deps compile eunit skip_deps=true
RUN echo "#!/bin/sh\n/opt/erlamsa/erlamsa -H 127.0.0.1:17771 -L -" > /usr/bin/erlamsa-service && chmod +x /usr/bin/erlamsa-service

EXPOSE 17771

ENTRYPOINT ["/usr/bin/erlamsa-service"]
