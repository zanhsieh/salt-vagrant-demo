reboot_all_minions:
  salt.function:
    - name: system.reboot
    - tgt: '*'

wait_for_reboots:
  salt.wait_for_event:
    - name: salt/minion/*/start
    - id_list:
      - minion1
      - minion2
      - minion3
    - require:
      - salt: reboot_all_minions
