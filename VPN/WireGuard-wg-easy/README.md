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
        ssh -L 51821:localhost:51821 -p 22 uesr@vpn.host.name.com
        ```
    * open http://localhost:51821 in web browser and login with credentials like in `.env` file

## Update
```bash
docker compose pull
docker compose down
docker compose up -d
```

## Links:

|Description|Link|
|--------|--------|
|GitHub|https://github.com/wg-easy/wg-easy|
|Container Registry|https://github.com/wg-easy/wg-easy/pkgs/container/wg-easy|
|Wireguard official site|https://www.wireguard.com/|
  