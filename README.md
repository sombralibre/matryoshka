# Matryoshka

Another way to run docker tasks inside a container.

## Description

This is just a `Dockerfile` that install [Containerd](https://containerd.io/) and [Docker](https://www.docker.com/) in the same container, along with [Supervisor](http://supervisord.org/) as process manager.

This shit works without binding host socket `/var/run/docker.sock` or host directory `/var/lib/docker`.

## Use case
- This can be useful for create and push docker images inside a kubernetes Pod.
- Maybe in some CI/CD platforms can be useful to execute docker commands.
- This would be useful to create a docker-in-docker inception, so no practical use, but we can, so we does.

### Build

You can build your own image o just pull it from [Docker Hub](https://hub.docker.com/repository/docker/sombralibre/matryoshka)

Generate new dockerfile from template, this will create a new `Dockerfile` in the current directory.

```bash
$ bash render_template.bash
```

Create the docker image with a valid repo `<account-name>/<repo-name>:<tag>`

```bash
$ docker build -t sombralibre/matryoshka:latest .
```

### Running

Run the first one as a privileged container.

```bash
docker run --name matryoshka-01 --rm --privileged -it sombralibre/matryoshka:latest
```

Enter into the first container.
```bash
docker exec -it matryoshka-01 bash
```

Run the second one.
```bash
docker run --name matryoshka-02 --rm --privileged -it sombralibre/matryoshka:latest
```

Enter into the second one and run a matryoshka-03, matryoshka-04 and so on, for what? just for fun

## Challenge

Drop me a PR replacing the current image with the maximum level of  deep .

# Current Winner

[@sombralibre](https://github.com/sombralibre)

![Winner](/images/inception.png)