# Docker for Bud

Multi-stage docker image with NPM and Golang docker image for building and deploying [bud](https://github.com/budlive/bud)

## How to use

Create a `Dockerfile` in your bud project like the following
```Dockerfile
FROM gjrdiesel/bud-docker AS builder
COPY . /app
RUN npm install
RUN go mod download
RUN bud build

FROM debian:buster-slim
COPY --from=builder /app/bud/app /
COPY --from=builder /app/go.mod /
CMD ["/app"]
```

Then you can run the following type of commands to build, tag, and run a built image
```bash
# Build and tag -- replace 'gjrdiesel/bud-demo' with one of your own
$ docker build -t gjrdiesel/bud-demo .

# Launch the docker app and control which port it runs on
$ docker run --rm -it -p 3000:3000 -e PORT=0.0.0.0:3000 gjrdiesel/bud-demo
```

Happy hacking, thanks Matt for the awesome framework.
