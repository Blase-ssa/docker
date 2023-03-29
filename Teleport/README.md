This Dockerfile allows to create a gravitational/Teleport image.

The first time you run it, a default config will be created if you don't have one.

When creating a container, you need to connect a persistent storage for the following locations:
|path in container|description|
|---|---|
|/var/lib/teleport|Data directory where Teleport daemon keeps its data.|
|/etc/teleport|Teleport configuration files|
|/var/lib/teleport/teleport.log|Teleport log (optional)|

Run container eample:
```sh
docker run -d -p 3023:3023 -p 30234:3025 -p 3025:3025 -p 3080:3080 --name=teleport --mount type=bind,source=/opt/configs/teleport/teleport.yaml,target=/etc/teleport/teleport.yaml --mount type=bind,source=/opt/configs/teleport/data,target=/var/lib/teleport --name teleport teleport
```
the command is too long and it is much better to use docker compose to store all this settings instead of running command like this.

For more information, visit:
* https://goteleport.com/docs/reference/config/ - Teleport Configuration Reference
* https://goteleport.com/docs/installation/ - Teleport installation guide
* https://goteleport.com/docs/management/guides/docker/ - Run Teleport using Docker
* https://github.com/gravitational/teleport - Teleport on GitHub
