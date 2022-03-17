FROM golang as builder

RUN apt-get update

WORKDIR /app

COPY hello.go ./

RUN go mod init hello.go

RUN go build -o /hello-builded

FROM scratch 

WORKDIR /

COPY --from=builder /hello-builded /hello-builded

CMD ["/hello-builded"]



