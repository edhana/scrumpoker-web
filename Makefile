BUILD := $(shell git rev-parse --short HEAD)
PROJECTNAME := $(shell basename "$(PWD)")

VERSION := $(shell git describe --tags)
GOBASE := $(shell pwd)
GOBIN := $(GOBASE)/bin

# Reserved for future use
LDFLAGS=-ldflags "-X=main.Version=$(VERSION) -X=main.Build=$(BUILD)"

build:
	go build $(LDFLAGS) -o $(GOBIN)/$(PROJECTNAME) cmd/scrumpoker/main.go

clean:
	rm -rf $(GOBIN)/*

config:
	dep ensure -update

default: build

