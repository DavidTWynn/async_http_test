FROM python:3.12

# Create a different user than root for security
RUN groupadd app && useradd -m -g app app
# Set the shell as bash and remove the shell for root for security
RUN chsh -s /bin/bash app
RUN chsh -s /usr/sbin/nologin root

USER app

WORKDIR /async_http_test_container

COPY . .

# Upgrade pip and install python library dependencies from pyproject.toml
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -e .[dev]