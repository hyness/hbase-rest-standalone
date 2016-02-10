# hbase-rest-standalone
A docker image of [HBase](https://hbase.apache.org/) running in standalone mode with [REST interface](https://hbase.apache.org/book.html#_rest) enabled.

[![Docker Stars](https://img.shields.io/docker/stars/hyness/hbase-rest-standalone.svg?style=flat-square)](https://hub.docker.com/r/hyness/spring-cloud-config-server)
[![Docker Pulls](https://img.shields.io/docker/pulls/hyness/hbase-rest-standalone.svg?style=flat-square)](https://hub.docker.com/r/hyness/spring-cloud-config-server)

## Usage
```
docker run -it --name=hbase \
      -h hbase \
      -p 2181:2181 \
      -p 8080:8080 \
      -p 60000:60000 \
      -p 60010:60010 \
      -p 60020:60020 \
      -p 60030:60030 \
      -v </path/to/hbasedata>:/data/hbase \
      -v </path/to/zookeeperdata>:/data/zookeeper \
      hyness/hbase-rest-standalone
```

#### Parameters
* `-h hbase` Set hostname to hbase (optional)
* `-p 2181` Zookeeper port
* `-p 8080` REST interface port
* `-p 60000` Master port
* `-p 60010` Master info port
* `-p 60020` Regionserver port
* `-p 60030` Regionserver info port
* `-v /data/hbase` HBase persistent data
* `-v /data/zookeeper` Zookeeper persistent data

#### HBase Master server interface
http://hbase:60010/master-status

#### Verifying HBase REST interface
```
# HBase Version
[user@host ~]$ curl http://hbase:8080/version/cluster

# Cluster Status
[user@host ~]$ curl http://hbase:8080/status/cluster

# Table List
[user@host ~]$ curl http://hbase:8080/
```
### Accessing the HBase shell
```
[user@host ~]$ docker exec -it hbase bash
user@host:/opt# hbase shell
```
