include ../Makefile
include ./Makefile.env

.PHONY: mysql.create.repl.login
mysql.create.repl.login: ## Create MySQL Replication user login
	@echo "$(GREEN)Creating MySQL Replication user login...$(RESET)"
	docker exec -i $(ct) mysql -uroot -p$(MYSQL_ROOT_PASSWORD) < $(SQL_PATH)/acl_repl_login_primary.sql