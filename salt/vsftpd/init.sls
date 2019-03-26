include:
  - vsftpd.installed
  - pam.vsftpd

# install vsftpd
vsftpd.service:
  service.running:
    - enable: True
    - reload: True
    - require:
      - pkg: vsftpd.packages
      - file: /etc/vsftpd/vsftpd.conf
    - watch:
      - file: /etc/vsftpd/vsftpd.conf

# vsfptd main configuration file
/etc/vsftpd/vsftpd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://vsftpd/files/vsftpd.conf
    - require:
      - pkg: vsftpd.packages

/etc/vsftpd/ftpusers:
  file.managed:
    - user: root
    - group: root
    - mode: 600 
    - source: salt://vsftpd/files/ftpusers
    - require:
      - pkg: vsftpd.packages

/etc/vsftpd/user_list:
  file.managed:
    - user: root
    - group: root
    - mode: 600 
    - source: salt://vsftpd/files/user_list
    - require:
      - pkg: vsftpd.packages

/etc/vsftpd/users:
  file.recurse:
    - user: root
    - group: root
    - dir_mode: 775
    - file_mode: 644 
    - include_empty: True
    - source: salt://vsftpd/files/users

allow-ftp-control:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match:
        - state
        - comment
    - comment: "Allow FTP-CONTROL"
    - connstate: NEW
    - source: '0.0.0.0/0'
    - dport: 21
    - proto: tcp
    - save: True

allow-ftp-data:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match:
        - state
        - comment
        - multiport
    - comment: "Allow FTP-DATA"
    - connstate: NEW
    - source: '0.0.0.0/0'
    - dport: 10000:10250 
    - proto: tcp
    - save: True
