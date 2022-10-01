FROM golang:alpine AS build-env
RUN mkdir /go/src/app && apk update && apk add git
ADD main.go go.mod go.sum /go/src/app/
WORKDIR /go/src/app
RUN go mod download && GOOS=linux go build -o hello .

FROM scratch
WORKDIR /opt
COPY --from=build-env /go/src/app/hello .
ENTRYPOINT [ "/opt/hello" ]