.PHONY:
.SILENT:

build:
	go build -o ./.bin/simple-template cmd/app/main.go

run: build
	./.bin/simple-template

build-image:
	docker build -t simple-template:v0.1 .

start-container:
	docker run --name simple-template -p 80:80 simple-template:v0.1

# linters
install-lint:
	@curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b ${GOPATH}/bin

run-lint:
	@golangci-lint run ./... -v

lint_autofix:
	@GO111MODULE=on ${GOLINT} run ./... -v --fix

