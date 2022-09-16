FROM golang:1.19.1-alpine AS builder

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=linux \
  GOARCH=amd64

WORKDIR /build
COPY go.mod go.sum main.go ./
RUN go mod download
RUN go build -a -ldflags '-s' -o main main.go

WORKDIR /usr/src/app
RUN cp /build/main .
FROM scratch
COPY --from=builder /usr/src/app/main .

ENTRYPOINT [ "/main" ]
