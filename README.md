# Jax Basic

## Jax env

### Image Build

```shell
$ docker build -t jax-environment .
```

### Run Container

```shell
$ docker run --rm -p 8888:8888 -v $(pwd):/app jax-environment
```

## TF env

### Image Build

```shell
$ docker build -f Dockerfile2 -t tf-environment .
```

### Run Container

```shell
$ docker run --rm -p 8888:8888 -v $(pwd):/app tf-environment
```
