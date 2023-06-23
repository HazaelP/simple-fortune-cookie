FROM golang:1.16 AS builder

WORKDIR /usr/src/myapp
COPY ./backend /usr/src/myapp/

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a

FROM scratch

COPY --from=builder /usr/src/myapp/backend ./

ENTRYPOINT ["./backend"]