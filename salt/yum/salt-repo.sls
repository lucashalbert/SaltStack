# SaltStack repo file
/etc/yum.repos.d/SaltStack.repo:
  file.managed:
    - source: salt://yum/files/SaltStack.repo
    - user: root
    - group: root
    - mode: 644
