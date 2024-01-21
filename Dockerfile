FROM python:3.12

# Update linux
RUN apt update && apt upgrade -y

# Create a different user than root for security
RUN groupadd app && useradd -m -g app app
# Set the shell as bash and remove the shell for root for security
RUN chsh -s /bin/bash app
RUN chsh -s /usr/sbin/nologin root

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

USER app
WORKDIR /async_http_test_container

# Install dependencies at a different layer than installing the project to speed up builds
# Need a custom script until pip will support this with hatchling
# Parses dependencies from pyproject.toml, then sends to /tmp/requirements.txt
COPY pyproject.toml .
RUN python -c "import tomllib;\
    data = tomllib.load(open('pyproject.toml', 'rb'));\
    open('container_requirements.txt', 'w').write('\n'.join(data['project']['dependencies']))"
RUN pip install -r container_requirements.txt
RUN rm container_requirements.txt

# Install python project from pyproject.toml. No dependencies because they were done before
COPY . .
RUN pip install --no-dependencies --no-cache-dir -e .