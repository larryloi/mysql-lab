TOP 20 members
[02:02] [00:00] [  0.82/s]

operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 1
select operations: 4979 times
us per select: 29371.182830994163
selects/s: 34.04697746611493

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_created_at_member_id",
                :Extra => "Using index condition",
             :min_rows => 24198,
             :max_rows => 38340,
         :min_filtered => 0.88,
         :max_filtered => 1.06,
         :avg_filtered => 0.964712,
                  :cnt => 4979
    }
]

TOP 20 members
[01:59] [00:00] [  0.84/s]

operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 30
select operations: 4971 times
us per select: 148611.99648324284
selects/s: 6.7289318740345285

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_created_at_member_id",
                :Extra => "Using index condition",
             :min_rows => 811372,
             :max_rows => 1130756,
         :min_filtered => 0.88,
         :max_filtered => 1.06,
         :avg_filtered => 0.963565,
                  :cnt => 4968
    },
    [1] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 1137460,
             :max_rows => 1191000,
         :min_filtered => 0.81,
         :max_filtered => 0.86,
         :avg_filtered => 0.843333,
                  :cnt => 3
    }
]


TOP 20 members
[01:55] [00:00] [  0.86/s]

operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 90
select operations: 4979 times
us per select: 82597.8184906722
selects/s: 12.106857278717722

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 1137460,
             :max_rows => 1375400,
         :min_filtered => 1.88,
         :max_filtered => 2.8,
         :avg_filtered => 2.09476,
                  :cnt => 4979
    }
]

TOP 20 members
[02:22] [00:00] [  0.70/s]

operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 1
select operations: 5000 times
us per select: 39886.32269818336
selects/s: 25.071250803613076

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_created_at_member_id",
                :Extra => "Using index condition",
             :min_rows => 27568,
             :max_rows => 41272,
         :min_filtered => 0.88,
         :max_filtered => 1.06,
         :avg_filtered => 0.964262,
                  :cnt => 5000
    }
]

TOP 20 members
[02:07] [00:00] [  0.79/s]

operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 30
select operations: 5000 times
us per select: 38598.318928293884
selects/s: 25.9078640667681

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_created_at_member_id",
                :Extra => "Using index condition",
             :min_rows => 825138,
             :max_rows => 1221624,
         :min_filtered => 0.88,
         :max_filtered => 1.06,
         :avg_filtered => 0.994568,
                  :cnt => 2927
    },
    [1] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 1137460,
             :max_rows => 1308064,
         :min_filtered => 0.8,
         :max_filtered => 0.95,
         :avg_filtered => 0.878538,
                  :cnt => 2073
    }
]


TOP 20 members
[02:08] [00:00] [  0.78/s]

operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 90
select operations: 5000 times
us per select: 41171.017880924046
selects/s: 24.288930696156882

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 1137460,
             :max_rows => 1375400,
         :min_filtered => 1.94,
         :max_filtered => 2.87,
         :avg_filtered => 2.576666,
                  :cnt => 5000
    }
]



--------------------------------------------------------------------------------
All members
 [02:16] [00:00] [  0.73/s]

operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 1
select operations: 5000 times
us per select: 24207.086233980954
selects/s: 41.31021760876943

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 72,
             :max_rows => 25288,
         :min_filtered => 0.02,
         :max_filtered => 0.07,
         :avg_filtered => 0.036742,
                  :cnt => 5000
    }
]


All members
[01:49] [00:00] [  0.91/s]

operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 30
select operations: 5000 times
us per select: 32275.531910173595
selects/s: 30.983222918931638

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 71,
             :max_rows => 25288,
         :min_filtered => 0.62,
         :max_filtered => 0.89,
         :avg_filtered => 0.696048,
                  :cnt => 5000
    }
]


All members
[01:49] [00:00] [  0.92/s]
operations date range: 2000-01-01 ~ 2010-01-01
operations days period: 90
select operations: 5000 times
us per select: 51103.80900427699
selects/s: 19.56801302064016

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 72,
             :max_rows => 25288,
         :min_filtered => 1.88,
         :max_filtered => 2.8,
         :avg_filtered => 2.09618,
                  :cnt => 5000
    }
]




[02:15] [00:00] [  0.74/s]

operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 1
select operations: 5000 times
us per select: 24097.0399947837
selects/s: 41.498872899595575

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 71,
             :max_rows => 25276,
         :min_filtered => 0.02,
         :max_filtered => 0.07,
         :avg_filtered => 0.040878,
                  :cnt => 5000
    }
]


[01:53] [00:00] [  0.88/s]

operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 30
select operations: 5000 times
us per select: 31847.668100893497
selects/s: 31.399473168082427

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 73,
             :max_rows => 25276,
         :min_filtered => 0.64,
         :max_filtered => 0.95,
         :avg_filtered => 0.858754,
                  :cnt => 5000
    }
]

[01:49] [00:00] [  0.91/s]

operations date range: 2010-01-01 ~ 2020-01-01
operations days period: 90
select operations: 5000 times
us per select: 49975.87980590761
selects/s: 20.009652734153384

"SELECT DISTINCT possible_keys, `key`, `Extra`, MIN(`rows`) AS `min_rows`, MAX(`rows`) AS `max_rows`, MIN(`filtered`) AS `min_filtered`, MAX(`filtered`) AS `max_filtered`, AVG(`filtered`) AS `avg_filtered`, COUNT(*) AS `cnt` FROM explain_logs WHERE `table`='b' GROUP BY possible_keys, `key`, `Extra`;"
[
    [0] {
        :possible_keys => "ix_member,ix_created_at_member_id",
                  :key => "ix_member",
                :Extra => "Using index condition",
             :min_rows => 71,
             :max_rows => 25276,
         :min_filtered => 1.84,
         :max_filtered => 2.86,
         :avg_filtered => 2.573504,
                  :cnt => 5000
    }
]