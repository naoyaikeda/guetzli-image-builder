FROM alpine:latest
LABEL maintainer="Naoya Ikeda"

WORKDIR /app
RUN apk add --no-cache git
RUN apk add --no-cache build-base
RUN apk add --no-cache make
RUN apk add --no-cache pkgconfig
RUN apk add --no-cache libpng
RUN apk add --no-cache libpng-dev
RUN apk add --no-cache zlib-dev
RUN git clone https://github.com/google/guetzli.git
WORKDIR /app/guetzli
RUN make
RUN cp ./bin/Release/guetzli /usr/local/bin/guetzli
WORKDIR /app
RUN rm -rf guetzli
