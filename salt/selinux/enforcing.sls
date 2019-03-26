# Update the selinux config file
/etc/selinux/config:
  file.managed:
    - source: salt://selinux/files/config.enforcing
    - user: root
    - group: root
    - mode: 644


# Set selinux to permissive
/sbin/setenforce 1:
  cmd.run
