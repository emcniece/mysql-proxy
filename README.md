# MySQL Proxy

Proxy / SSH Tunnel access to MySQL instances, particularly AWS Aurora RDS which doesn't allow public access. Works with Rancher Secrets

```
                  +-------------+      +-----------+
+---------+       |             |      |           |      +-----------+
|  MySQL  |       | MySQL-Proxy |      |  EC2 SSH  |      | AWS Aurora|
|  Client +------^+             +-----^+  Instance +-----^+  Cluster  |
+---------+       |             |      |           |      +-----------+
                  +-------------+      +-----------+
```
<sup>Generated with http://asciiflow.com/</sup>

## Usage

```
docker pull emcniece/mysql-proxy

docker run -d \
  -v $(pwd)/my-secret-key:/run/secrets/my-secret-key \
  -e PROXY_KEY=/run/secrets/my-secret-key \
  -e PROXY_USER=ec2-user \
  -e PROXY_HOSTNAME=ec2-12-345-67-89.us-west-2.compute.amazonaws.com \
  -e PROXY_MYSQL_HOSTNAME=my-rds.cluster-someid.us-west-2.rds.amazonaws.com \
  -e DEBUG=-vvv \
```