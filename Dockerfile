FROM golang:1.13.1-alpine3.10 as builder



WORKDIR $GOPATH/src/newerton/golang-codeeducation-rocks/
COPY main.go .
ARG CGO_ENABLED=0
RUN go build -ldflags="-s -w" -o /go/app

FROM scratch


COPY --from=builder /go/app /go/app

CMD ["/go/app"]
