FROM golang:alpine AS builder

WORKDIR /app

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags="-s -w" -o app main.go

FROM scratch

COPY --from=builder /app/app /app/app

CMD ["/app/app"]
