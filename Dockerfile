FROM registry.access.redhat.com/ubi8/ubi:8.5

RUN dnf -y install nginx && \
    dnf clean all

COPY index.html hawtconfig.json /usr/share/nginx/html/
COPY dist/ /usr/share/nginx/html/dist/
COPY node_modules/ /usr/share/nginx/html/node_modules/
COPY test-plugins/ /usr/share/nginx/html/test-plugins/

# redirect 404 -> /
RUN sed -i 's|error_page 404 /404.html|error_page 404 /index.html|' /etc/nginx/nginx.conf

RUN mkdir -p /usr/share/nginx/html/oauth && touch /usr/share/nginx/html/oauth/config.js

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
