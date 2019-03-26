# Update the selinux config file
/etc/selinux/config:
  file.managed:
    - source: salt://selinux/files/config.permissive
    - user: root
    - group: root
    - mode: 644


# Set selinux to permissive
/sbin/setenforce 0:
  cmd.run
