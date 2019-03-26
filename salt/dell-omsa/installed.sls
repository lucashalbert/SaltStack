bootstrap_dell_repos:
  cmd.run:
    - name: wget -q -O - http://linux.dell.com/repo/hardware/dsu/bootstrap.cgi | bash

dell-omsa.packages:
  pkg.installed:
    - pkgs:
      - dell-system-update
      - httpd
      - mod_ssl
      - srvadmin-all

/etc/systemd/system/dell-omsa.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://dell-omsa/files/dell-omsa.service

reload_systemctl_daemon:
  cmd.run:
    - name: systemctl daemon-reload
