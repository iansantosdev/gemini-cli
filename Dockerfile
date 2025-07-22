FROM node:24.4.1-alpine

ARG GEMINI_VERSION

RUN apk --no-cache add curl

RUN curl -L -o /usr/local/lib/gemini.js "https://github.com/google-gemini/gemini-cli/releases/download/v${GEMINI_VERSION}/gemini.js"

ENTRYPOINT ["node", "/usr/local/lib/gemini.js"]
