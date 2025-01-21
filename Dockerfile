FROM gradle:jdk23-graal AS builder
COPY demo /spring/demo
WORKDIR /spring/demo
RUN gradle nativeCompile

FROM debian:trixie-slim
COPY --from=builder /spring/demo/build/native/nativeCompile/demo /app/demo
WORKDIR /app
ENTRYPOINT ./demo