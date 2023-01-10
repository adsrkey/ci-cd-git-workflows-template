FROM golang:1.19-alpine3.17 AS builder

COPY . /github.com/onmono/simple-template
WORKDIR /github.com/onmono/simple-template

RUN go mod download
RUN go build -o ./bin/simple-template cmd/app/main.go

FROM alpine:latest

WORKDIR /root/

COPY --from=0 /github.com/onmono/simple-template/bin/simple-template .

EXPOSE 80

CMD ["./simple-template"]