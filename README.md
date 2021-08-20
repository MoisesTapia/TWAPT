![](https://github.com/MoisesTapia/TWAPT/blob/deploy/TWAPT.png)
#### Trainig| Web Application Penetration Testing

![docker](https://img.shields.io/badge/Docker-v19.03.12-blue?style=plastic&logo=docker)
![Maintainer](https://img.shields.io/badge/Maintainer-m4dh4tt3r-success?style=plastic&logo=terraform)
[![Build Status](https://img.shields.io/badge/Build-success?style=plastic&logo=travis)](https://travis-ci.com/MoisesTapia/TWAPT)
![Build Status](https://travis-ci.com/MoisesTapia/TWAPT.svg?branch=deploy)
# Requirements

- [X] Docker
- [X] docker-compose

## Webs
 - [X] Webgoat    : localhost:8080/WebGoat
 - [X] Mutillidae : localhost:8088/mutillidae
 - [X] DVWAP      : localhost:8081
 - [X] bwapp      : localhost:8082/install.php
 - [X] Juice-Shop : localhost:8083
 - [X] NinjaWeb   : localhost:8899
 - [X] VulnWordpress : localhost:8086

## Monitoring

You can monitoring your services or containers with cAdvisor this is a new integration.
just you follow the next steps:
1 Open your Browser.
2 In the search bar write `localhost:8085`.
3 Done you can see the information about your containers.

locañhost:8085

## Usage mode.

```bash
git clone https://github.com/MoisesTapia/TWAPT
cd TWAPT
docker-compose up -d

```
output

```bash
➜  TWAPT git:(deploy) ✗ docker-compose up -d      
Creating network "twapt_pentesting" with driver "bridge"
Creating juiceshop ... done
Creating webgoat   ... done
Creating dvwap     ... done
Creating bwapp     ... done
Creating bricks    ... done
Creating owasp17   ... done
Creating ninjaweb  ... done
➜  TWAPT git:(deploy) ✗ 

```
'docker-compose ps'

```bash
➜  TWAPT git:(deploy) ✗ docker-compose ps
  Name                 Command               State                          Ports                        
---------------------------------------------------------------------------------------------------------
bricks      /run.sh                          Up      3306/tcp, 0.0.0.0:8084->80/tcp                      
bwapp       /run.sh                          Up      3306/tcp, 0.0.0.0:8082->80/tcp                      
dvwap       /main.sh                         Up      0.0.0.0:8081->80/tcp                                
juiceshop   docker-entrypoint.sh npm start   Up      0.0.0.0:8083->3000/tcp                              
ninjaweb    /bin/sh -c /usr/sbin/apach ...   Up      0.0.0.0:8899->80/tcp                                
owasp17     /usr/bin/supervisord             Up      3306/tcp, 0.0.0.0:443->443/tcp, 0.0.0.0:8088->80/tcp
webgoat     java -Djava.security.egd=f ...   Up      0.0.0.0:8080->8080/tcp                              
➜  TWAPT git:(deploy) ✗ 

```

## Stoping the services

'docker-compose stop or docker-compose down'
## Contributors

Design: @onahump / https://github.com/onahump

