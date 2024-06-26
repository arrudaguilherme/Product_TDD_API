FROM python:3.11-slim-buster

ENV PYTHONUNBUFFERED 1
ENV PATH=/root/.local/bin:$PATH
ENV PYTHONPATH /

RUN apt-get update && apt-get install -y curl \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && poetry config virtualenvs.create false

WORKDIR /

COPY ./poetry.lock .
COPY ./pyproject.toml .

RUN poetry install

RUN apt-get remove curl -y

COPY ./app /app
WORKDIR /app
