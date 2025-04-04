FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o tracker

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/tracker /app/tracker
CMD ["/app/tracker"]
