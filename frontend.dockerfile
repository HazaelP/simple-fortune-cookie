FROM golang:1.16 AS builder

WORKDIR /usr/src/myapp
COPY ./frontend /usr/src/myapp/

RUN  go build -a

FROM scratch

COPY --from=builder /usr/src/myapp/frontend ./
COPY --from=builder /usr/src/myapp/static ./static
COPY --from=builder /usr/src/myapp/templates ./templates

ENTRYPOINT ["./frontend"]