FROM alpine:3.8

RUN apk add openssh-client --update --no-cache

ADD run.sh /

CMD run.sh