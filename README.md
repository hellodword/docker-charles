# docker-charles

## docker vnc

```sh
docker build -t charles .

mkdir -p ~/Downloads/charles; docker run --rm -v ~/Downloads/charles:/home/app -p 127.0.0.1:5800:5800 -p 8888:8888 -p 8889:8889 charles
```

- how to paste: use the vnc clipboard and paste via middle-click

## docker forwarding

> not working yet
