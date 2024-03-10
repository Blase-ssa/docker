# No-IP client
The client service to update no-ip DNS record.

# First run
```bash
docker compose build
docker run -ti --rm --volume ./conf:/usr/local/etc/ noip_client-noip /usr/local/bin/noip2 -C
```
Follow instructions on a screen. After execution in `./conf` dir there will be a file `no-ip2.conf` which is necessary for daemon.
Chmod this file:
```bash
chmod a+r ./conf/no-ip2.conf
```

# Service run
just run:
```bash
docker compose up -d
```

# Links and info
* check `quick_notes.md` file to read my notes
* for noip support visit https://www.noip.com/support