{% if grains['virtual'] == 'VMware' %}
include:
  - open-vm-tools.installed

vmtoolsd.service:
  service.running:
    - enable: True
    - reload: False
    - require:
      - pkg: open-vm-tools.packages
{% endif %}
