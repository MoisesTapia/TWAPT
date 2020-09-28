#!/bin/bash

echo 'root:'${SERVER_ROOT_PASSWORD} |chpasswd
/usr/sbin/sshd -D