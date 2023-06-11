FROM python:3.11.0

WORKDIR /app

COPY . .

RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir -e . 