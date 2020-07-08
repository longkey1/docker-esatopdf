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
ENV WKHTMLTOPDF_VERSION 0.12.5
ENV WKHTMLTOPDF_DEB wkhtmltox_0.12.5-1.stretch_amd64.deb

# install wkhtmltopdf
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/$WKHTMLTOPDF_VERSION/$WKHTMLTOPDF_DEB
RUN dpkg -i $WKHTMLTOPDF_DEB
RUN wkhtmltopdf --version

# install pandoc
RUN apt-get install -y pandoc

# install noto-fonts
RUN apt-get install -y fonts-noto
