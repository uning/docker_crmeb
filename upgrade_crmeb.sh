#!/bin/zsh

curdir=$(pwd)
cversion=$1

[[ $cversion == ''  ]] && cversion='v1.3.0'


zipdir=$curdir/source_zip/
zipfile=crmeb_merchant-${cversion}.zip

[[ ! -f $zipdir/$zipfile  ]] && echo "$zipdir/$zipfile not exist." && exit

unzipdir=$curdir/source_zip/$cversion.crmeb
mkdir -p $unzipdir
cd $unzipdir && unzip $zipdir/$zipfile

cmdir=$unzipdir/install/compiled

[[ ! -d $cmdir  ]] && echo $cmdir not exist. && exit
cd $cmdir && unzip compiled74.zip

#copy 配置文件
cp -rf $cmdir/basic $unzipdir/crmewb/
cp -rf $cmdir/crmeb.php $unzipdir/config/

bakupdir=$curdir/bakupdir/$(date +%Y%m%d%H%I%S).crmeb;
mkdir -p $bakupdir
rsync -avvz  $curdir/crmeb/* $bakupdir/
mkdir -p $curdir/crmeb
rsync -avv $unzipdir/*  $curdir/crmeb/
