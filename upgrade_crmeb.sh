#!/bin/zsh

CUR_DIR=$(pwd)
CRMEB_VERSION=$1

[[ $CRMEB_VERSION == ''  ]] && CRMEB_VERSION='v1.3.0'


zipdir=$CUR_DIR/source_zip/
zipfile=crmeb_merchant-${CRMEB_VERSION}.zip

[[ ! -f $zipdir/$zipfile  ]] && echo "$zipfile not exist." && exit

unzipdir=$CUR_DIR/source_zip/$CRMEB_VERSION.crmeb
mkdir -p $unzipdir
cd $unzipdir && unzip $zipdir/$zipfile

cmdir=$unzipdir/install/compiled

[[ ! -d $cmdir  ]] && echo $cmdir not exist. && exit
cd $cmdir && unzip compiled74.zip

#copy 配置文件
cp -rf $cmdir/basic $unzipdir/crmewb/
cp -rf $cmdir/crmeb.php $unzipdir/config/

echo "cp -d $unzipdir/* to $CUR_DIR/crmeb/ "
