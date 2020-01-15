FROM node:10.16.0-alpine

LABEL maintainer="Han Verstraete <welteki@pm.me>" \
      version="2.0" \
      description="openHAB log viewer"

RUN mkdir -p /openhab/userdata/logs

RUN npm install frontail@4.8.0 -g --production --unsafe-perm

RUN wget      -O /usr/lib/node_modules/frontail/preset/openhab.json \
              https://raw.githubusercontent.com/openhab/openhabian/master/includes/frontail-preset.json \
    && wget   -O /usr/lib/node_modules/frontail/web/assets/styles/openhab.css \
              https://raw.githubusercontent.com/openhab/openhabian/master/includes/frontail-theme.css

EXPOSE 9001
CMD frontail \
    --ui-highlight \
    --ui-highlight-preset /usr/lib/node_modules/frontail/preset/openhab.json \
    -t openhab \
    -l 2000 \
    -n 200 \
    /openhab/userdata/logs/events.log \
    /openhab/userdata/logs/openhab.log
