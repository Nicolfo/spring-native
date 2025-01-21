FROM debian:trixie-slim

# Install necessary dependencies

COPY demo/build/native/nativeCompile/demo /app/demo
WORKDIR /app
ENTRYPOINT ./demo