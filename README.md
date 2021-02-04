 1. 将crmeb 代码包放在source_zip下
 2. 执行./upgrade_crmeb.sh [version]   #默认 version='v1.3.0'
 3. docker-compose up 调试
 4. docker-compose up -d 实际运行

 注意:没有跑nginx，可以参照docker运行nginx代理
 保证 8324 能访问
