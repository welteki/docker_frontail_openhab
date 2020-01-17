FROM node:10.16.0-alpine

ARG FRONTAIL_VERSION

LABEL maintainer="Han Verstraete <welteki@pm.me>" \
      version="2.0" \
      description="openHAB log viewer"

RUN apk add --no-cache wget

RUN mkdir -p /openhab/userdata
RUN mkdir -p /var/log/openhab2
RUN ln -s /var/log/openhab2 /openhab/userdata/logs

RUN npm install frontail@$FRONTAIL_VERSION -g --production --unsafe-perm

RUN wget      -O /usr/local/lib/node_modules/frontail/preset/openhab.json \
              https://raw.githubusercontent.com/openhab/openhabian/master/includes/frontail-preset.json \
    && wget   -O /usr/local/lib/node_modules/frontail/web/assets/styles/openhab.css \
              https://raw.githubusercontent.com/openhab/openhabian/master/includes/frontail-theme.css

EXPOSE 9001
CMD frontail \
    --ui-highlight \
    --ui-highlight-preset /usr/local/lib/node_modules/frontail/preset/openhab.json \
    -t openhab \
    -l 2000 \
    -n 200 \
    /var/log/openhab2/events.log \
    /var/log/openhab2/openhab.log
