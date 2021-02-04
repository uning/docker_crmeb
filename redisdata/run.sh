
DIR=`pwd`
docker run -p 6379:6379 \
 --name redis -v $DIR/redis.conf:/etc/redis/redis.conf -v $DIR/data:/data -d redis redis-server /etc/redis/redis.conf --appendonly yes

