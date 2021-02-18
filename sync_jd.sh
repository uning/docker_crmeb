#!/bin/zsh

rsync -avvz \
    --exclude='*/data/*' \
    --exclude='.git*' \
    env.* *.yml  *.sh\
    php_crmeb redisdata mysqldata\
    devjd:./docker/mshop/
rsync -avvz source_zip/*.zip  devjd:./docker/mshop/source_zip/
