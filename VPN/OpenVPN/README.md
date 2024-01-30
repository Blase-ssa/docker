# OpenVPN server with WEB UI

## Note
* Only 2 simultaneous connections are available in the free version.

## Setup
- run:
    ```bash
    docker compose up -d
    ```
    Warning: Do not open port `943` on firewall! To connect to AdminUI use:
    ```bash
    ssh -L 943:localhost:943 -p 22 uesr@vpn.host.name.com
    ```

- Open https://localhost:943/admin with a default user/password of admin/password
- During first login, make sure that the "Authentication" in the webui is set to "Local" instead of "PAM". Then set up the user accounts with their passwords (user accounts created under PAM do not survive container update or recreation).

    Warning: The "admin" account is a system (PAM) account and after container update or recreation, its password reverts back to the default. It is highly recommended to block this user's access for security reasons.

- Create another user and set as an admin,
    - Navigate to `USER MANAGMENT` --> `User Permissions`
    - Fill in the new input box.
    - Check checkbox for Admin rights
    - Save changes
- Log in as the new user,
    - Delete the "admin" user in the gui,
- Modify the as.conf file under `./config/etc` and replace the line `boot_pam_users.0=admin` with `boot_pam_users.0=iuhik8i9yuhiku8ub` (this only has to be done once and will survive container recreation)
    ```bash
    sudo vim ./config/etc/as.conf
    ```
    
    IMPORTANT NOTE: Commenting out the first pam user in as.conf creates issues in 2.7.5. To make it work while still blocking pam user access, uncomment that line and change admin to a random nonexistent user as described above.

- Configure network
    - goto `Configuration` --> `Network Settings`
    - change the "Hostname or IP Address" section to either your domain name or public ip address.

- Disable web interface on port 9443
    - goto `Configuration` --> `Network Settings`
        - Disable `Admin Web Server forwarding`
        - Disable `Client Web Server forwarding`
    - goto `Configuration` --> `CWS Settings`
        - Disable ALL :)

- Allow ports 9443 and 1194/udp
    ```bash
    sudo ufw allow 9443
    sudo ufw allow 1194/udp
    ```

## Update
```bash
docker compose pull
docker compose down
docker compose up -d
```

## links:
    https://hub.docker.com/r/linuxserver/openvpn-as
    https://openvpn.net/
