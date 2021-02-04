#!/bin/zsh


#查看预装的php模块
docker run --rm mshop_crmeb:latest php -m

#本地构建
docker-compose build
cp env.docker.compose crmeb/.env
