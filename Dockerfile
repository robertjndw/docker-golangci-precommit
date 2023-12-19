FROM golangci/golangci-lint:latest

ARG GOLANG_VERSION=1.21.5

RUN apt-get update
RUN apt-get install -y curl git python3-pip

RUN curl -L https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz --output go${GOLANG_VERSION}.linux-amd64.tar.gz

RUN rm -rf /usr/local/go 
RUN tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin

RUN pip install pre-commit --break-system-packages

CMD ["pre-commit"]