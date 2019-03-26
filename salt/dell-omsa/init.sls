{%- if grains['manufacturer'] == 'Dell Inc.' %}

include:
  - dell-omsa.installed
  - dell-omsa.snmpd

dell-omsa.service:
  service.running:
    - enable: True
    - require:
      - pkg: dell-omsa.packages

{%- endif %}
