FROM debian:buster-slim

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        ca-certificates \
        curl \
        dumb-init \
        unzip && \
    rm -fr /var/lib/apt/lists/*

RUN curl -fsSL https://deno.land/x/install/install.sh | sh -s v1.0.0

ENV PATH "/root/.deno/bin:$PATH"

RUN mkdir -p /src
COPY src/app.ts /src/app.ts

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["deno", "run", "--allow-net", "/src/app.ts"]
