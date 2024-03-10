# WireGuard
## Run
* rename `example.env` --> `.env`
* edit `.env`
* run
    ```bash
    docker compose up -d
    ```
* enable port 51820/udp
    ```bash
    sudo ufw allow 51820/udp
    ```
* configure WireGuard
    * connect to remote server
        ```bash
        ssh -L 5000:localhost:5000 -p 22 uesr@vpn.host.name.com
        ```
    * open http://localhost:5000 in web browser and login with credentials like in `.env` file

## Update
```bash
docker compose pull
docker compose down
docker compose up -d
```

## Links:

|Description|Link|
|--------|--------|
|Wireguard docker hub|https://hub.docker.com/r/linuxserver/wireguard|
|Wireguard image documentation|https://github.com/linuxserver/docker-wireguard|
|Wireguard official site|https://www.wireguard.com/|
|UI GitHub|https://github.com/ngoduykhanh/wireguard-ui|
  