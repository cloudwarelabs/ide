FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y nodejs git
RUN git clone git://github.com/cloudwarelabs/ide.git ide
WORKDIR /ide
RUN apt-get install -y wget make build-essential python
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN ./scripts/install-sdk.sh
RUN sh ./build/build-standalone.sh
WORKDIR /ide/build/standalonebuild
RUN apt-get install -y npm
CMD ["npm", "start"]
