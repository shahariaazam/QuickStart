# Quickstart

## Docker

**Build and run the script**

```sh
docker build -t php-script .
docker run -it --rm php-script
```

**Build and run testCases**

```sh
docker build -t php-script .
docker run -it --rm --entrypoint bash php-script
vendor/bin/phpunit
```
