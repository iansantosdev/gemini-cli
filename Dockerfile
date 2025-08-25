FROM node:alpine

ARG GEMINI_VERSION

ENV NODE_NO_WARNINGS=1

RUN apk --no-cache add curl

RUN curl -L -o /usr/local/lib/gemini.js "https://github.com/google-gemini/gemini-cli/releases/download/${GEMINI_VERSION}/gemini.js"

ENTRYPOINT ["node", "/usr/local/lib/gemini.js"]
