FROM golang:1.20.10-bullseye

RUN apt update \
  && apt install -y vim \
  python3 \
  python3-pip \
  nodejs \
  npm
RUN pip3 install -U pip \
  && pip3 install online-judge-tools
RUN npm install -g atcoder-cli
RUN acc config default-test-dirname-format test
RUN acc config default-task-choice all

# コマンドアライアス
RUN echo 'alias ojgo="oj t -c \"go run ./main.go\" -d test/"' >> ~/.bashrc
RUN echo 'alias addgo="cp /go/src/work/template.go ./main.go"' >> ~/.bashrc


ENV GO111MODULE on
WORKDIR /go/src/work

# install go tools
RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
RUN go install github.com/ramya-rao-a/go-outline@latest
RUN go install github.com/nsf/gocode@latest
RUN go install github.com/acroca/go-symbols@latest
RUN go install github.com/fatih/gomodifytags@latest
RUN go install github.com/josharian/impl@latest
RUN go install github.com/haya14busa/goplay/cmd/goplay@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install golang.org/x/lint/golint@latest
RUN go install golang.org/x/tools/gopls@latest
