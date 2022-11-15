FROM node:18-buster

COPY --from=golang:1.19-buster /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"

RUN curl -sf curl https://raw.githubusercontent.com/livebud/bud/main/install.sh | sh

WORKDIR /app
