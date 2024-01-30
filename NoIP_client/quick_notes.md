### Installation instruction
```bash
sudo -i
apt update
apt install make gcc wget tar -y
cd /usr/local/src/
wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz
tar xf noip-duc-linux.tar.gz
cd noip-2.1.9-1/
make install
apt remove make gcc -y ; apt autoremove -y && sudo apt clean
```


### First run
```bash
sudo /usr/local/bin/noip2 -C
```

### Config file location
After first run the configuration file will be created
/usr/local/etc/no-ip2.conf

### Autorun
```bash
sudo vim  /etc/systemd/system/noip2.service
```
```ini
[Unit]
Description=No Ip client server (https://www.noip.com)
Documentation=https://www.noip.com/support
After=network.target auditd.service

[Service]
ExecStart=/usr/local/bin/noip2
ExecStop=/usr/local/bin/noip2 -K $MAINPID
#`ps aux |grep "noip2" |grep nobody |tr -s " "| cut -d' ' -f2`
KillMode=process
Restart=on-failure
Type=forking #notify
RuntimeDirectoryMode=0755

[Install]
WantedBy=multi-user.target
```
Enable service: 
```bash
sudo systemctl enable noip2.service
sudo systemctl start noip2.service
```

### Note
it is recommended to restart noip service once in a week or month.
Edit cron jobs list:
```bash
sudo crontab -e
```
Add string like this:
```
0 3 * * 7 systemctl restart noip2
```