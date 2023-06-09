# Destination: 
This Dockerfile allows to create a certbot image.

# How to use:

## 1. Build image
```sh
docker build -t certbot ./
```

## 2. Run container and mount directory
```sh
docker run -ti -p 80:80 -p 443:443 --mount=type=bind,source=/opt/configs/certs,target=/etc/letsencrypt/ --rm certbot
```

## 3. Run command to generate certificate (check commandline on certbot website)
```sh
sudo certbot certonly --standalone
```

# Links:
* https://certbot.eff.org/instructions - Certbot Instructions
* https://letsencrypt.org/docs/ - Let's Encrypt Documentation
