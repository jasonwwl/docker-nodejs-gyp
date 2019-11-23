FROM node:lts-alpine3.10

RUN node -v

RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

RUN apk --no-cache add --virtual native-deps \
    g++ gcc libgcc libstdc++ linux-headers autoconf automake make nasm python git
    
RUN npm config set unsafe-perm true

RUN npm install npm@latest -g

RUN npm install --quiet node-gyp -g

RUN node -v
