-- CREATE USER 'clusteradmin'@'%' IDENTIFIED BY 'cladmin'
CREATE USER `clusteradmin`@`%` IDENTIFIED WITH 'caching_sha2_password' BY 'cladmin' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK PASSWORD HISTORY DEFAULT PASSWORD REUSE INTERVAL DEFAULT PASSWORD REQUIRE CURRENT DEFAULT;

GRANT ALL privileges ON *.* TO 'clusteradmin'@'%' with grant option;

-- MySQL 8.0.16+ requires the following to be set for GTID replication
-- reset master;
