SRC_DIR = src
BIN_DIR = bin
BIN_NAME = server
SERVER = cmd/server/main.go

all: run

build:
	go build -o $(BIN_DIR)/$(BIN_NAME) $(SRC_DIR)/$(SERVER)

run:
	go run $(SRC_DIR)/$(SERVER)
