FROM golang:alpine AS builder
# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git
RUN mkdir /go/src/app && apk update && apk add git
ADD main.go go.mod go.sum /go/src/app/
WORKDIR /go/src/app
# download dependencies
# removing debug informations  
# compile only for linux target and disabling cross compilation
RUN go mod download && GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o note .

FROM scratch
WORKDIR /app
COPY --from=builder /go/src/app/note .
CMD [ "/app/note" ]