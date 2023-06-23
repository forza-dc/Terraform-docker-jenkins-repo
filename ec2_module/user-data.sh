#!/bin/bash -xe

sudo apt-get install docker.io -y
systemctl start docker
systemctl enable docker
 