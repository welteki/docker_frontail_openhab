FROM node:10.16.0-alpine

ARG FRONTAIL_VERSION

LABEL maintainer="Han Verstraete <welteki@pm.me>" \
    description="openHAB log viewer"

RUN apk add --no-cache wget

RUN npm install frontail@$FRONTAIL_VERSION -g --production --unsafe-perm

RUN FRONTAIL_BASE="/usr/local/lib/node_modules/frontail" \
    && wget     -O ${FRONTAIL_BASE}/preset/openhab.json \
    https://raw.githubusercontent.com/openhab/openhabian/openHAB3/includes/frontail/frontail-preset.json \
    && wget     -O ${FRONTAIL_BASE}/preset/openhab_dark.json \
    https://raw.githubusercontent.com/openhab/openhabian/openHAB3/includes/frontail/frontail-preset_dark.json \
    && wget     -O ${FRONTAIL_BASE}/preset/openhab_AEM.json \
    https://github.com/Interstellar0verdrive/frontail_AEM/blob/fa17953935834e96d5e8a6f67f7879d8cf0d745c/preset/openhab_AEM.json \
    && wget     -O ${FRONTAIL_BASE}/web/index.html \
    https://raw.githubusercontent.com/openhab/openhabian/openHAB3/includes/frontail/index.html \
    && wget     -O ${FRONTAIL_BASE}/web/assets/styles/bootstrap.min.css \
    https://raw.githubusercontent.com/openhab/openhabian/openHAB3/includes/frontail/bootstrap.min.css \
    && wget     -O ${FRONTAIL_BASE}/web/assets/styles/openhab.css \
    https://raw.githubusercontent.com/openhab/openhabian/openHAB3/includes/frontail/frontail-theme.css \
    && wget     -O ${FRONTAIL_BASE}/web/assets/styles/openhab_dark.css \
    https://raw.githubusercontent.com/openhab/openhabian/openHAB3/includes/frontail/frontail-theme_dark.css

RUN mkdir -p /openhab/userdata
RUN ln -s /openhab/userdata/logs /var/log/openhab

ENV FRONTAIL_THEME="openhab"

EXPOSE 9001
CMD frontail \
    --disable-usage-stats \
    --ui-highlight \
    --ui-highlight-preset /usr/local/lib/node_modules/frontail/preset/${FRONTAIL_THEME}.json \
    --theme ${FRONTAIL_THEME}\
    -l 2000 \
    -n 200 \
    ${FRONTAIL_OPTS} \
    /var/log/openhab/events.log \
    /var/log/openhab/openhab.log
