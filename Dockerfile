# Create a build image
FROM golang:1.8 as build
WORKDIR /go/src
COPY src/app.go .
RUN go build -v -o app

# Create a run image
FROM scratch
WORKDIR /root/
# Copy the file from the build image
COPY --from=build /go/src/app .
CMD ["./app"]
