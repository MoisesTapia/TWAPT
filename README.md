# T|WAPT
#### Trainig| Web Application Penetration Testing

![docker](https://img.shields.io/badge/Docker-v19.03.12-blue?style=plastic&logo=docker)
![Maintainer](https://img.shields.io/badge/Maintainer-Equinockx-success?style=plastic&logo=terraform)


# Requirements

- [X] Docker
- [X] docker-compose

## Webs
 - [X] Webgoat: localhost:8080/WebGoat
 - [X] DVWAP: localhost:8081
 - [X] bwapp: localhost:8082/install.php
 - [X] Juice-Shop: localhost:8083

## Usage mode.

```bash
git clone https://github.com/MoisesTapia/TWAPT
cd TWAPT
docker-compose up -d

```
output

```bash
Creating network "cwapt_default" with the default driver
Creating dvwap     ... done
Creating juiceshop ... done
Creating bwapp     ... done
Creating webgoat   ... done
```
'docker-compose ps'

```bash
➜  TWAPT git:(deploy) ✗ docker-compose ps
  Name                 Command               State               Ports             
-----------------------------------------------------------------------------------
bwapp       /run.sh                          Up      3306/tcp, 0.0.0.0:8082->80/tcp
dvwap       /main.sh                         Up      0.0.0.0:8081->80/tcp          
juiceshop   docker-entrypoint.sh npm start   Up      0.0.0.0:8083->3000/tcp        
webgoat     java -Djava.security.egd=f ...   Up      0.0.0.0:8080->8080/tcp        
```

## Stoping the services

'docker-compose stop or docker-compose down'




