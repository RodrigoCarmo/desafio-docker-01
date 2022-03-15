FROM golang as builder

RUN apt-get update

WORKDIR /myapp

COPY ./hello.go .

RUN go build hello.go 

FROM scratch 

COPY --from=builder /myapp/hello.go /go/bin/hello.go

CMD ["/go/bin/hello.go"]



