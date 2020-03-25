### Redis local cluster setup
Scripts to create a redis cluster on your local machine.

Based on the official redis tutorial (requires redis 5.0+).

Port bindings can be changed according to your requirements.

Source:-

https://redis.io/topics/cluster-tutorial

### How to use
clone the repo inside and run the scripts in the following order
```shell script
create-config.sh
start_instances.sh
start_cluster_mode.sh
```   
After executing all the above scripts run the following command to start redis-cli in cluster mode
```shell script
redis-cli -c -p <PORT>
```
To kill all instances run 
```shell script
kill_instances.sh
```

To flush the nodes.conf files run 
```shell script
flush_node_config.sh
```

