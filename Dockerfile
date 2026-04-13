FROM alpine AS builder

ARG VERSION=1.0

RUN apk add --no-cache bash

RUN echo "<html><body>" > /app.html && \
    echo "<h1>Informacje o serwerze</h1>" >> /app.html && \
    echo "<p>IP serwera: $(hostname -i)</p>" >> /app.html && \
    echo "<p>Hostname: $(hostname)</p>" >> /app.html && \
    echo "<p>Wersja aplikacji: ${VERSION}</p>" >> /app.html && \
    echo "</body></html>" >> /app.html

FROM nginx:alpine

COPY --from=builder /app.html /usr/share/nginx/html/index.html

HEALTHCHECK --interval=30s --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost || exit 1

EXPOSE 80