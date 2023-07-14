# For check any innodb blocking issue happen and sent mail alert

## requiement
create an mysql account and have below view and underlaying table select premission.

SHOW CREATE VIEW sys.innodb_lock_waits CREATE ALGORITHM = TEMPTABLE DEFINER = `mysql.sys` @`localhost` SQL SECURITY INVOKER VIEW `sys`.`innodb_lock_waits` (
  `wait_started`,
  `wait_age`,
  `wait_age_secs`,
  `locked_table`,
  `locked_table_schema`,
  `locked_table_name`,
  `locked_table_partition`,
  `locked_table_subpartition`,
  `locked_index`,
  `locked_type`,
  `waiting_trx_id`,
  `waiting_trx_started`,
  `waiting_trx_age`,
  `waiting_trx_rows_locked`,
  `waiting_trx_rows_modified`,
  `waiting_pid`,
  `waiting_query`,
  `waiting_lock_id`,
  `waiting_lock_mode`,
  `blocking_trx_id`,
  `blocking_pid`,
  `blocking_query`,
  `blocking_lock_id`,
  `blocking_lock_mode`,
  `blocking_trx_started`,
  `blocking_trx_age`,
  `blocking_trx_rows_locked`,
  `blocking_trx_rows_modified`,
  `sql_kill_blocking_query`,
  `sql_kill_blocking_connection`
) AS 
SELECT 
  `r`.`trx_wait_started` AS `wait_started`,
  TIMEDIFF(NOW(), `r`.`trx_wait_started`) AS `wait_age`,
  TIMESTAMPDIFF(
    SECOND,
    `r`.`trx_wait_started`,
    NOW()
  ) AS `wait_age_secs`,
  CONCAT(
    `sys`.`quote_identifier` (`rl`.`OBJECT_SCHEMA`),
    '.',
    `sys`.`quote_identifier` (`rl`.`OBJECT_NAME`)
  ) AS `locked_table`,
  `rl`.`OBJECT_SCHEMA` AS `locked_table_schema`,
  `rl`.`OBJECT_NAME` AS `locked_table_name`,
  `rl`.`PARTITION_NAME` AS `locked_table_partition`,
  `rl`.`SUBPARTITION_NAME` AS `locked_table_subpartition`,
  `rl`.`INDEX_NAME` AS `locked_index`,
  `rl`.`LOCK_TYPE` AS `locked_type`,
  `r`.`trx_id` AS `waiting_trx_id`,
  `r`.`trx_started` AS `waiting_trx_started`,
  TIMEDIFF(NOW(), `r`.`trx_started`) AS `waiting_trx_age`,
  `r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,
  `r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,
  `r`.`trx_mysql_thread_id` AS `waiting_pid`,
  `sys`.`format_statement` (`r`.`trx_query`) AS `waiting_query`,
  `rl`.`ENGINE_LOCK_ID` AS `waiting_lock_id`,
  `rl`.`LOCK_MODE` AS `waiting_lock_mode`,
  `b`.`trx_id` AS `blocking_trx_id`,
  `b`.`trx_mysql_thread_id` AS `blocking_pid`,
  `sys`.`format_statement` (`b`.`trx_query`) AS `blocking_query`,
  `bl`.`ENGINE_LOCK_ID` AS `blocking_lock_id`,
  `bl`.`LOCK_MODE` AS `blocking_lock_mode`,
  `b`.`trx_started` AS `blocking_trx_started`,
  TIMEDIFF(NOW(), `b`.`trx_started`) AS `blocking_trx_age`,
  `b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,
  `b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,
  CONCAT(
    'KILL QUERY ',
    `b`.`trx_mysql_thread_id`
  ) AS `sql_kill_blocking_query`,
  CONCAT(
    'KILL ',
    `b`.`trx_mysql_thread_id`
  ) AS `sql_kill_blocking_connection` 
FROM
  (
    (
      (
        (
          `performance_schema`.`data_lock_waits` `w` 
          JOIN `information_schema`.`INNODB_TRX` `b` 
            ON (
              (
                `b`.`trx_id` = CAST(
                  `w`.`BLOCKING_ENGINE_TRANSACTION_ID` AS CHAR CHARSET utf8mb4
                )
              )
            )
        ) 
        JOIN `information_schema`.`INNODB_TRX` `r` 
          ON (
            (
              `r`.`trx_id` = CAST(
                `w`.`REQUESTING_ENGINE_TRANSACTION_ID` AS CHAR CHARSET utf8mb4
              )
            )
          )
      ) 
      JOIN `performance_schema`.`data_locks` `bl` 
        ON (
          (
            `bl`.`ENGINE_LOCK_ID` = `w`.`BLOCKING_ENGINE_LOCK_ID`
          )
        )
    ) 
    JOIN `performance_schema`.`data_locks` `rl` 
      ON (
        (
          `rl`.`ENGINE_LOCK_ID` = `w`.`REQUESTING_ENGINE_LOCK_ID`
        )
      )
  ) 
ORDER BY `r`.`trx_wait_started` 
