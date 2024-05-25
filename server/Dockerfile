FROM service/app_builder AS builder

WORKDIR /usr/src/app

COPY . .

RUN cargo build --release

FROM alpine:3.19

RUN apk add libgcc && \
    apk add curl

COPY --from=builder /usr/src/app/target/release/server .

CMD ["./server"]
