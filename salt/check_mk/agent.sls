/etc/xinetd.d/check-mk-caching-agent:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://check_mk/files/check-mk-caching-agent
    - require:
      - pkg: check_mk.packages

/etc/xinetd.d/check-mk-agent:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://check_mk/files/check-mk-agent
    - require:
      - pkg: check_mk.packages



