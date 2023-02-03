# Benchmark conclusion

## Index Test 測試
 - 針對以下查詢語句, 模擬實際數據情況
 ```
 SELECT SQL_NO_CACHE m.`member_id` ,m.`name` ,m.`country_code` ,m.`status` ,b.game_id ,b.amt ,b.bet_time ,b.created_at FROM member m  JOIN bet b ON b.member_id = m.member_id WHERE b.member_id = member_val AND  b.created_at BETWEEN 'created_at_val' AND TIMESTAMPADD(DAY, #{period_days}, 'created_at_val') LIMIT 20;
 ```
- 模擬表結構
```
CREATE TABLE `member` (
    `member_id` INT(11) NOT NULL , 
    `name` VARCHAR(85) NOT NULL,
    `balance` INT(11) NOT NULL,
    `country_code` VARCHAR(5) NOT NULL,
    `status` VARCHAR(45) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    PRIMARY KEY (member_id) USING BTREE,
    KEY `ix_created_at` (`created_at`) USING BTREE,
    KEY `ix_updated_at` (`updated_at`) USING BTREE
    )  ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs ROW_FORMAT=DYNAMIC;
```
```
CREATE TABLE `bet` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `member_id` INT(11) NOT NULL,
  `game_id` INT(11) NOT NULL,
  `amt` INT(11) NOT NULL,
  `bet_time` DATETIME(3) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`,`member_id`,`game_id`,`created_at`),
  UNIQUE KEY `member_id` (`member_id`,`game_id`,`created_at`),
  KEY `ix_member_id` (`member_id`),
  KEY `ix_created_at` (`created_at`),
  KEY `ix_created_at_member_id` (`created_at`,`member_id`),
  KEY `ix_updated_at_member_id` (`updated_at`,`member_id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs
```

- member table 模擬數據 100000 rows
- bet table 模擬數據 139057425 rows
- 測試不同情況, 例如普通玩家他們數據量比較少, 和 熱門玩家 數據量大, 和不同時間短, MySQL optimize 怎樣決定使用什麼 index.
- 總體數據分布
 ```
rows_in_year	count(*)
2000	5495245
2001	5478351
2002	5479358
2003	5486016
2004	5498223
2005	5484985
2006	5479843
2007	5488417
2008	5506299
2009	5480511
2010	6775819
2011	6775288
2012	6792989
2013	6784315
2014	6768437
2015	6773321
2016	6806894
2017	6776328
2018	6782506
2019	6763132
2020	5491367
2021	5485412
2022	5404369
```
- 模擬了 20 個 熱門玩家，在 2010 ~ 2019 製造更的數據

## 第一輪測試
Table bet, 他們的 member_id, created_at 獨立 indexes
### 測試熱門玩家
#### 測試時間段: 2000-01-01 ~ 2010-01-01. (數據小) 每個情況測試 5000 次

查詢語句 隨機 1 天
```
選用了 ix_created_at, 平均 74 ms, 13 select/second
select operations: 4971 times
us per select: 74825.84850764075
selects/s: 13.364365656313087

        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_created_at",
```
                  
查詢語句 隨機 30 天
```
選用了 ix_created_at, 平均 1345 ms, 0.7 select/second
select operations: 4973 times
us per select: 1345993.0340633045
selects/s: 0.7429458954785112

        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_created_at",
```
                  
查詢語句 隨機 90 天
```
選用了 ix_member, 平均 118 ms, 8.45 select/second
select operations: 4974 times
us per select: 118323.59681807678
selects/s: 8.451399609982326

        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
```
                  
#### 測試時間段: 2010-01-01 ~ 2020-01-01. (數據大) 每個情況測試 5000 次
查詢語句 隨機 1 天
```
選用了 ix_created_at, 平均 72 ms, 13.82 select/second
select operations: 5000 times
us per select: 72336.42659857869
selects/s: 13.82429361004195
```

查詢語句 隨機 30 天
```
選用了 ix_member 1271 次, ix_created_at 3729 次, 平均 80 ms, 12.372 select/second
select operations: 5000 times
us per select: 80827.48891916126
selects/s: 12.37202854340977
```

查詢語句 隨機 90 天
```
選用了 ix_member, 平均 43 ms, 23.18 select/second
select operations: 5000 times
us per select: 43128.955677337945
selects/s: 23.186279015919894
```


### 測試普通玩家
#### 測試時間段: 2000-01-01 ~ 2010-01-01. (數據小) 每個情況測試 5000 次
查詢語句 隨機 1 天
```
選用了 ix_member, 平均 23 ms, 42.88 select/second
select operations: 5000 times
us per select: 23315.896120108664
selects/s: 42.88919434400617
```

查詢語句 隨機 30 天
```
選用了 ix_member, 平均 32 ms, 30.98 select/second
select operations: 5000 times
us per select: 32273.823399096727
selects/s: 30.98486310822373
```

查詢語句 隨機 90 天
```
選用了 ix_member, 平均 51 ms, 19.59 select/second
select operations: 5000 times
us per select: 51042.24538728595
selects/s: 19.591614601051404
```

#### 測試時間段: 2010-01-01 ~ 2020-01-01. (數據小) 每個情況測試 5000 次
查詢語句 隨機 1 天
```
選用了 ix_member, 平均 22 ms, 43.94 select/second
select operations: 5000 times
us per select: 22755.942223593593
selects/s: 43.94456578305027
```

查詢語句 隨機 30 天
```
選用了 ix_member, 平均 31 ms, 32.24 select/second
select operations: 5000 times
us per select: 31014.151641353965
selects/s: 32.24334528198443
```

查詢語句 隨機 90 天
```
選用了 ix_member, 平均 50 ms, 19.73 select/second
select operations: 5000 times
us per select: 50670.41287124157
selects/s: 19.73538290562378
```


## 第二輪測試
Table bet,  member_id 獨立 indexes, 新建一條 composite index (created_at, member)