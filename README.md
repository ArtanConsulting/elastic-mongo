# Elastic Mongo
**Docker setup to get Elasticsearch and MongoDB up and running**



### Install Docker and docker-compose

* https://docs.docker.com/installation
* https://docs.docker.com/compose/install/

```bash

git clone https://github.com/soldotno/elastic-mongo.git
cd elastic-mongo
docker-compose up -d  # If you skip -d, then the entire clusted will go down when
                      # mongosetup and elasticsearch-river-setup are done.
```

Now you have Elasticsearch and MongoDB configured with mongo-connector.

```bash
$ docker-compose ps  # =>
Name                       Command                      State                       Ports           
-------------------------------------------------------------------------------------------------------------
elasticmongo_connector_1    /scripts/mongo-             Up                                                    
                  connector.sh                                                                      
elasticmongo_disablediskt   /scripts/disable-disk-      Up                          27017/tcp                 
reshold_1                   tres ...                                                                          
elasticmongo_elasticsearc   /docker-entrypoint.sh       Up                          0.0.0.0:9200->9200/tcp,   
h_1                         elas ...                                                0.0.0.0:9300->9300/tcp    
elasticmongo_mongo1_1       /usr/bin/mongod --replSet   Up                          0.0.0.0:27017->27017/tcp,
                  ...                                                     0.0.0.0:28017->28017/tcp  
elasticmongo_mongo2_1       /usr/bin/mongod --replSet   Up                          0.0.0.0:27019->27017/tcp,
                  ...                                                     0.0.0.0:28019->28017/tcp  
elasticmongo_mongo3_1       /usr/bin/mongod --replSet   Up                          0.0.0.0:27018->27017/tcp,
                  ...                                                     0.0.0.0:28018->28017/tcp  
elasticmongo_mongosetup_1   /scripts/setup.sh           Exit 0                                                
elasticmongo_verify_1       /scripts/query.sh           Up                          27017/tcp

```

**Elasticsearch API**
```
curl http://localhost:9200
```

**MONGO URL**
```
localhost:27017
```
