
CREATE USER IF NOT EXISTS 'replica_user'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'replica_pass';

GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';

FLUSH PRIVILEGES;

SHOW BINARY LOG STATUS;