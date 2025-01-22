ARG PROJECT_NAME="demo"

# Stage 1: Build the project with Gradle and GraalVM
FROM gradle:jdk23-graal AS builder
ARG PROJECT_NAME
COPY ${PROJECT_NAME} /${PROJECT_NAME}
WORKDIR /${PROJECT_NAME}
RUN gradle nativeCompile

# Stage 2: Copy the whole build output into a minimal Debian image
FROM debian:trixie-slim
ARG PROJECT_NAME
COPY --from=builder /${PROJECT_NAME}/build /app/build
WORKDIR /app/build/native/nativeCompile

# Run the compiled native binary
ENTRYPOINT ./${PROJECT_NAME}