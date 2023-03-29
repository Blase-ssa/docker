This Dockerfile allows to create a gravitational/Teleport image.

The first time you run it, a default config will be created if you don't have one.

When creating a container, you need to connect a persistent storage for the following locations:
|path in container|description|
|---|---|
|/var/lib/teleport|Data directory where Teleport daemon keeps its data.|
|/etc/teleport|Teleport configuration files|
|/var/lib/teleport/teleport.log|Teleport log (optional)|


For more information, visit:
* https://goteleport.com/docs/reference/config/ - Teleport Configuration Reference
* https://goteleport.com/docs/installation/ - Teleport installation guide
* https://goteleport.com/docs/management/guides/docker/ - Run Teleport using Docker
* https://github.com/gravitational/teleport - Teleport on GitHub
