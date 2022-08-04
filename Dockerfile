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
    Pillow==6.2.2 \
    click \
    markdown \
    markdown-include \
    weasyprint \
    watchdog

RUN mkdir /app

COPY md2pdf.py /app

WORKDIR /app
