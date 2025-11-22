.PHONY: all easerver easerver_linux clean

all: easerver easerver_linux

easerver:
	go build -o easerver ./cmd/easerver

easerver_linux:
	GOOS=linux GOARCH=amd64 go build -o easerver_linux ./cmd/easerver

clean:
	rm -f easerver easerver_linux
