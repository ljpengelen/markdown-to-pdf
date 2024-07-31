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
    Pillow==10.0.1 \
    click==8.1.7 \
    markdown==3.5 \
    markdown-include==0.8.1 \
    weasyprint==60.1 \
    watchdog==3.0.0 \
    pydyf==0.10.0

RUN mkdir /app

COPY md2pdf.py /app

WORKDIR /app
