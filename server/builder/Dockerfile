FROM alpine:3.19 AS builder

RUN apk update && \
    apk upgrade && \
    apk add rust && \
    apk add cargo

WORKDIR /usr/src/app

COPY . .

RUN cargo build --release

# FROM alpine:3.19

# RUN apk add libgcc

# COPY --from=builder /usr/src/app/target/release/auth-service-rust .

# CMD ["./auth-service-rust"]
