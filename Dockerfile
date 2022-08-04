FROM ubuntu:jammy

RUN apt-get update \
  && apt-get -y install \
    libcairo2 \
    libffi-dev \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    python3-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/*

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN pip3 install --no-cache \
    Pillow==9.0.1 \
    click==7.1.1 \
    markdown==3.2.1 \
    markdown-include==0.5.1 \
    weasyprint==51 \
    watchdog==0.10.2

RUN mkdir /app

COPY md2pdf.py /app

WORKDIR /app
