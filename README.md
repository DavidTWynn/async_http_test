# Async HTTP Test

![Python version](https://img.shields.io/badge/python%20version-3.11-good)
![Environment](https://img.shields.io/badge/Environment-Windows-blue)
![Coding style](https://img.shields.io/badge/code%20style-black-000000.svg)

Trying to get some basic examples of using an API with async

# Resources

- Real Python tutorial - https://realpython.com/async-io-python/

# Install

Download source code

```bash
git clone https://github.com/DavidTWynn/async_http_test
cd async_http_test
```

Create virtual environment

```bash
py -3.11 -m venv venv
venv/Scripts/activate
```

Upgrade pip

```bash
py -m pip install --upgrade pip
```

Use pip to install the project and dependencies

```bash
pip install -e .
```

Optional: Install dev dependencies to contribute

```bash
pip install -e .[dev]
```

# Files

- async_http_test/
  - async_http_test.py - Examples for http async requests
  - counter_async.py - sleep examples of sync and async
- Dockerfile - Settings to create a Docker image for the project
- .vscode/settings.json - MS VSCode IDE workspace settings for linting, formatting, etc.
  tests/ - pytest unit tests
- .gitignore - Files to not track by git
- .pre-commit-config.yaml - pre-commit hooks for git. Runs linting before committing
- google_docstring.mustache - Python autodocstring extension template based on Google Python style guide
- pyproject.toml - Project info, dependencies, and dev dependencies.
- README.md - Overview of the project
- .git - git change history files
- venv - Created on demand for project virtual environment for Python dependencies

# Run

## counter_async.py

Shows how you can use async with sleep vs a sync version

```python
python async_http_test/counter_async.py
```

<details>
<summary>
Example output
</summary>

```
One
One
One
Two
Two
Two
Async executed in 1.00 seconds.
One
Two
One
Two
One
Two
Sync executed in 3.00 seconds.
```

</details>

# pre-commit hooks

Linting to be ran before committing

- black
- isort
- flake8
- bandit

# Update pre-commit hooks

If a hook is added to .pre-commit-config.yaml, update the .git/hooks files

```bash
pre-commit install
```

# Create Docker image

Using the Dockerfile, a new Docker image can be created locally.
This needs to be done in the project directory.

Make sure project is up to date

```sh
git pull
```

Create image

```sh
docker build -t async_http_test .
```

Verify image

```sh
docker image ls
```

Run image

```sh
docker run -it -d --name async_http_test async_http_test
```

Verify running container

```sh
docker container ls -a
```

Enter container

```sh
docker exec -it async_http_test bash
```

Run 'exit' from shell when done.

For development, VSCode's "Dev Containers" extension can be used to remote into the container and open the project in the /app directory. The code can be ran normally in the container. When VSCode is connected to the container, the VSCode extensions will then need to be installed for development.

## Clean up Docker

When development work is done with Docker, the container can be stopped and the image can be deleted.

Find container name

```sh
docker container ls
```

Name should be under NAMES column for "async_http_test" using that IMAGE

Stop the container

```sh
docker container stop async_http_test
```

Delete the container (Needs to be stopped first)

```sh
docker container rm async_http_test
```

Locate the image (should be 'async_http_test')

```sh
docker image ls
```

Delete the image

```sh
docker image rm async_http_test
```
