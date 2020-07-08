FROM debian:stretch

RUN apt-get update && apt-get install -y \
apt-utils \
fontconfig \
libfreetype6 \
libjpeg62-turbo \
libpng16-16 \
libx11-6 \
libxcb1 \
libxext6 \
libxrender1 \
netbase \
wget \
xfonts-75dpi \
xfonts-base

# wkhtmltopdf
ENV WKHTMLTOPDF_VERSION 0.12.6-1

# install wkhtmltopdf
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/${WKHTMLTOPDF_VERSION}/wkhtmltox_${WKHTMLTOPDF_VERSION}.stretch_amd64.deb
RUN dpkg -i $WKHTMLTOPDF_DEB
RUN wkhtmltopdf --version

# install pandoc
RUN apt-get install -y pandoc

# install noto-fonts
RUN apt-get install -y fonts-noto
