FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y nodejs npm  git
RUN git clone git://github.com/cloudwarelabs/ide.git ide
RUN apt-get install -y wget make build-essential python
RUN ln -s /usr/bin/nodejs /usr/bin/node
WORKDIR /ide
RUN sh ./scripts/install-sdk.sh
RUN sh ./scripts/makestandalone.sh
RUN sh ./build/build-standalone.sh
WORKDIR /ide/build/standalonebuild
CMD ["npm", "start"]
