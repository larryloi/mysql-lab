TOP 20 members
[06:11] [00:00] [  0.27/s]
operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 1
select operations: 4971 times
us per select: 74825.84850764075
selects/s: 13.364365656313087
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_created_at",
                :Extra => "Using index condition",
             :min_rows => 21370,
             :max_rows => 33392,
         :min_filtered => 0.71,
         :max_filtered => 0.88,
         :avg_filtered => 0.788578
                  :cnt => 4971
    }
]

TOP 20 members
[01:51:33] [00:00] [  0.01/s]
operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 30
select operations: 4973 times
us per select: 1345993.0340633045
selects/s: 0.7429458954785112
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_created_at",
                :Extra => "Using index condition",
             :min_rows => 689040,
             :max_rows => 948006,
         :min_filtered => 0.76,
         :max_filtered => 1.05,
         :avg_filtered => 0.887639,
                  :cnt => 4972
    },
    [1] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 982394,
             :max_rows => 982394,
         :min_filtered => 0.71,
         :max_filtered => 0.71,
         :avg_filtered => 0.71,
                  :cnt => 1
    }
]


TOP 20 members
 [100/100] [100%] [09:48] [00:00] [  0.17/s]
operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 90
select operations: 4974 times
us per select: 118323.59681807678
selects/s: 8.451399609982326
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 1166632,
             :max_rows => 1355000,
         :min_filtered => 1.35,
         :max_filtered => 2.31,
         :avg_filtered => 1.779387,
                  :cnt => 4974
    }
]


TOP 20 members
[100%] [06:01] [00:00] [  0.28/s]
operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 1
select operations: 5000 times
us per select: 72336.42659857869
selects/s: 13.82429361004195
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_created_at",
                :Extra => "Using index condition",
             :min_rows => 23742,
             :max_rows => 41498,
         :min_filtered => 0.89,
         :max_filtered => 1.03,
         :avg_filtered => 0.954538,
                  :cnt => 5000
    }
]

TOP 20 members
[06:44] [00:00] [  0.25/s]
operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 30
select operations: 5000 times
us per select: 80827.48891916126
selects/s: 12.37202854340977
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 1163298,
             :max_rows => 1332864,
         :min_filtered => 0.79,
         :max_filtered => 0.93,
         :avg_filtered => 0.840732,
                  :cnt => 1271
    },
    [1] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_created_at",
                :Extra => "Using index condition",
             :min_rows => 852480,
             :max_rows => 1218390,
         :min_filtered => 0.87,
         :max_filtered => 1.02,
         :avg_filtered => 0.946667,
                  :cnt => 3729
    }
]

TOP 20 members
[03:35] [00:00] [  0.46/s]operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 90
select operations: 5000 times
us per select: 43128.955677337945
selects/s: 23.186279015919894
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 1137460,
             :max_rows => 1375400,
         :min_filtered => 1.75,
         :max_filtered => 2.79,
         :avg_filtered => 2.199648,
                  :cnt => 5000
    }
]


----------------------------------------------------------------------------------------------------------------------------------------

All members
[01:56] [00:00] [  0.86/s]
operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 1
select operations: 5000 times
us per select: 23315.896120108664
selects/s: 42.88919434400617
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 72,
             :max_rows => 25248,
         :min_filtered => 0.02,
         :max_filtered => 0.07,
         :avg_filtered => 0.037054,
                  :cnt => 5000
    }
]

[02:41] [00:00] [  0.62/s]
operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 30
select operations: 5000 times
us per select: 32273.823399096727
selects/s: 30.98486310822373
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 71,
             :max_rows => 25288,
         :min_filtered => 0.53,
         :max_filtered => 0.73,
         :avg_filtered => 0.65032,
                  :cnt => 5000
    }
]


[04:15] [00:00] [  0.39/s]
operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 90
select operations: 5000 times
us per select: 51042.24538728595
selects/s: 19.591614601051404
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 71,
             :max_rows => 25288,
         :min_filtered => 1.31,
         :max_filtered => 2.31,
         :avg_filtered => 1.789124,
                  :cnt => 5000
    }
]


[01:53] [00:00] [  0.88/s]

operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 1
select operations: 5000 times
us per select: 22755.942223593593
selects/s: 43.94456578305027
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 71,
             :max_rows => 25060,
         :min_filtered => 0.02,
         :max_filtered => 0.07,
         :avg_filtered => 0.040192,
                  :cnt => 5000
    }
]



[02:35] [00:00] [  0.64/s]

operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 30
select operations: 5000 times
us per select: 31014.151641353965
selects/s: 32.24334528198443
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 71,
             :max_rows => 25276,
         :min_filtered => 0.63,
         :max_filtered => 0.93,
         :avg_filtered => 0.805382,
                  :cnt => 5000
    }
]


 [04:13] [00:00] [  0.39/s]

operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 90
select operations: 5000 times
us per select: 50670.41287124157
selects/s: 19.73538290562378
"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 71,
             :max_rows => 25276,
         :min_filtered => 1.75,
         :max_filtered => 2.64,
         :avg_filtered => 2.2021,
                  :cnt => 5000
    }
]