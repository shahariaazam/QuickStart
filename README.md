# Quickstart

## Run application

To make it easier, the project can be run inside Docker container which has all the necessary setup with required dependencies

#### Build Docker image

```sh
docker build . -t php-dev
```

#### Lunch Docker Container

```sh
docker run -it -v "$(pwd):/usr/src/app" -w "/usr/src/app" --name app-quickstart php-dev bash
```
