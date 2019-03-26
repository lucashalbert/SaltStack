# mysql-community repo file
/etc/yum.repos.d/mysql-community.repo:
  file.managed:
    - source: salt://yum/files/mysql-community.repo
    - user: root
    - group: root
    - mode: 644

# mysql-community-source repo file
/etc/yum.repos.d/mysql-community-source.repo:
  file.managed:
    - source: salt://yum/files/mysql-community-source.repo
    - user: root
    - group: root
    - mode: 644

/etc/pki/rpm-gpg/RPM-GPG-KEY-mysql:
  file.managed:
    - source: salt://yum/files/RPM-GPG-KEY-mysql
    - user: root
    - group: root
    - mode: 644
