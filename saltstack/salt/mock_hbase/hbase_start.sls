start:
  cmd.run:
    - name: "echo 'mock hadoop start' && sleep 10"

{# THIS IS REQUIRED IN ORDER TO WORK #}
sync_everything:
  saltutil.sync_all:
    - refresh: True

{%- set minion_id = salt['grains.get']('id') %}
notify_salt_master:
  event.send:
    - name: sym/hbase/{{ minion_id }}/status/start
    - data: "Minion {{ minion_id }} hbase started"
