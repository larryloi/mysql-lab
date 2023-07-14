Sequel.migration do
  change do
    create_table(:sess_lock_wait) do
      DateTime :wait_started, null: true
      Time :wait_age, null: true
      Bignum :wait_age_secs, null: true
      String :locked_table, text: true, null: true
      String :locked_table_schema, size: 64, null: true
      String :locked_table_name, size: 64, null: true
      String :locked_table_partition, size: 64, null: true
      String :locked_table_subpartition, size: 64, null: true
      String :locked_index, size: 64, null: true
      String :locked_type, size: 32, null: false
      Bignum :waiting_trx_id, unsigned: true, null: false, default: 0
      DateTime :waiting_trx_started, null: false, default: '0000-00-00 00:00:00'
      Time :waiting_trx_age, null: true
      Bignum :waiting_trx_rows_locked, unsigned: true, null: false, default: 0
      Bignum :waiting_trx_rows_modified, unsigned: true, null: false, default: 0
      Bignum :waiting_pid, unsigned: true, null:false,default:0
      String :waiting_query,text:true,null:true
      String :waiting_lock_id,size:128,null:false
      String :waiting_lock_mode,size:32,null:false
      Bignum :blocking_trx_id,unsigned:true,null:false,default:0
      Bignum :blocking_pid,unsigned:true,null:false,default:0
      String :blocking_query,text:true,null:true
      String :blocking_lock_id,size:128,null:false
      String :blocking_lock_mode,size:32,null:false
      DateTime:blocking_trx_started,null:false,default:'0000-00-00 00:00:00'
      Time:blocking_trx_age,null:true
      Bignum:blocking_trx_rows_locked,unsigned:true,null:false,default:0
      Bignum:blocking_trx_rows_modified,unsigned:true,null:false,default:0 
      String :sql_kill_blocking_query,size:32,null:false 
      String :sql_kill_blocking_connection,size:26,null:false 
    end
  end
end


