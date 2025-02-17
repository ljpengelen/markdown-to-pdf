FROM ubuntu:noble

RUN apt-get update \
  && apt-get -y install \
    libcairo2 \
    libffi-dev \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    pipx \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/*

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN mkdir /app
WORKDIR /app

ENV PIPENV_VENV_IN_PROJECT=1
COPY Pipfile /app
COPY Pipfile.lock /app
RUN pipx run pipenv sync

ENV PATH /app/.venv/bin:$PATH

COPY md2pdf.py /app
