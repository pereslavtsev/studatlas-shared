FROM golang:alpine

RUN apk add --update make git
RUN go get -u github.com/golang/protobuf/proto

RUN mkdir /sources
WORKDIR /sources

ENV GOPATH=$HOME/go
ENV PATH=$PATH:$GOPATH/bin

COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .

RUN make lint
RUN mkdir /sources/docs
RUN make docs_generate


