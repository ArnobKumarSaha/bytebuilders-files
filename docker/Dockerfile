
FROM golang:latest AS base

WORKDIR /web-server


COPY . .
RUN go build -o webserver .

#multistage starts
FROM alpine:latest

#WORKDIR /web-server
COPY --from=base /web-server/webserver /webserver

EXPOSE 8080

ENTRYPOINT [ "/webserver" ]





