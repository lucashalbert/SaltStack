include:
  - check_mk.installed
  - check_mk.agent

xinetd.service:
  service.running:
    - enable: True
    - require:
      - pkg: check_mk.packages
      - file: /etc/xinetd.d/check-mk-agent
      - file: /etc/xinetd.d/check-mk-caching-agent
    - watch:
      - file: /etc/xinetd.d/check-mk-agent
      - file: /etc/xinetd.d/check-mk-caching-agent
