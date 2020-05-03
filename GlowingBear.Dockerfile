FROM nginx:latest as GLOWINGBEAR
RUN apt-get update\
    && apt-get -y install git
RUN cd /usr/share/nginx/\
    && git clone https://github.com/glowing-bear/glowing-bear.git\
    && mv html html.old\
    && mv glowing-bear html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]