FROM python:3.11.4

RUN groupadd -r async_http_test && useradd -r -g async_http_test async_http_test
RUN chsh -s /usr/sbin/nologin root

USER $SERVICE_NAME

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -e .