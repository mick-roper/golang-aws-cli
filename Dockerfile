ARG GO_VERSION=1.18

FROM golang:${GO_VERSION}

RUN apt update && apt install unzip

WORKDIR /usr/local/aws-cli

RUN  curl -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

COPY ./aws-cli.pub .
RUN gpg --import aws-cli.pub
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip.sig -o awscliv2.sig 
RUN ls -a
RUN gpg --verify awscliv2.sig awscliv2.zip

RUN unzip ./awscliv2.zip
RUN ./aws/install
RUN aws --version