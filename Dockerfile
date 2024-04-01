FROM python:3.11-slim-buster

ENV PYTHONUNBUFFERED 1
ENV PATH="/root/.local/bin:$PATH"
ENV PYTHON PYTHONPATH='/'

RUN apt-get update -y && \
    apt-get install -y curl && \
    apt-get install -y python3-venv && \
    apt-get clean

COPY ./src /src
WORKDIR /src

RUN python -m venv venv
ENV PATH="/API-Produtos/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

