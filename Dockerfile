FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o my-app .

FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/my-app .
EXPOSE 8080
CMD ["./my-app"]
