# Dell repo file
/etc/yum.repos.d/dell-system-update.repo:
  file.managed:
    - source: salt://yum/files/dell-system-update.repo
    - user: root
    - group: root
    - mode: 644
