start_all_hbase:
  salt.state:
    - tgt: '*'
    - sls:
      - mock_hbase.hbase_start

wait_for_hbase_start:
  salt.wait_for_event:
    - name: sym/hbase/*/status/start
    - id_list:
      - minion1
      - minion2
      - minion3
    - timeout: 300
    - require:
      - salt: start_all_hbase
