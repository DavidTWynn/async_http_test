FROM python:3.12

RUN groupadd app && useradd -m -g app app
RUN chsh -s /bin/bash app
RUN chsh -s /usr/sbin/nologin root

USER $SERVICE_NAME

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -e .[dev]