BUILD := $(shell git rev-parse --short HEAD)
PROJECTNAME := $(shell basename "$(PWD)")

GOBASE := $(shell pwd)
GOBIN := $(GOBASE)/bin

# Reserved for future use
# LDFLAGS=-ldflags "-X=main.Version=$(VERSION) -X=main.Build=$(BUILD)"

build:
	go build -o $(GOBIN)/$(PROJECTNAME) cmd/scrumpoker/main.go

clean:
	rm -rf $(GOBIN)/*

default: build

