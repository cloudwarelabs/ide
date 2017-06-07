FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y nodejs git
RUN git clone git://github.com/cloudwarelabs/ide.git ide
RUN apt-get install -y wget make build-essential python
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN sh /ide/scripts/install-sdk.sh
RUN sh /ide/scripts/makestandalone.sh
RUN sh /ide/build/build-standalone.sh
WORKDIR /ide/build/standalonebuild
RUN apt-get install -y npm
CMD ["npm", "start"]
