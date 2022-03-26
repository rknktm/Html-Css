FROM nginx:latest
LABEL maintainer="e@gmail.com" version="1.0" name="myweb"
RUN apt-get update && apt-get install curl -y 
ENV KULLANICI="Merhaba"
WORKDIR /usr/share/nginx/html
COPY . .
RUN rm index.html
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 CMD curl -f http://localhost/ || exit 1
CMD sed -e "s/Kullanici/$KULLANICI/" 1.html >> 2.html && sed -e "s/Hostname/$HOSTNAME/" 2.html >> index.html; rm 1.html 2.html; nginx -g "daemon off;"