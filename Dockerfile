FROM vault:1.5.3

WORKDIR /home/vault

RUN apk add curl

ENTRYPOINT [ "/bin/sh", "run.sh" ]
