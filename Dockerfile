FROM nginx:latest
LABEL maintainer="erkanoktem@gmail.com"
LABEL version="1.0"
LABEL name="myweb"
RUN apt-get update && apt-get install curl -y 
WORKDIR /usr/share/nginx/html
COPY . .
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 CMD curl -f http://localhost/ || exit 1
CMD nginx -g "daemon off;"