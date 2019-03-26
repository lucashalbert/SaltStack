base:
  '*':
    - requirements
    - bash
    - nrpe
    - check_mk
    - ntp
    - openldap
    - postfix
    - rssh
    - rsyslog
    - salt
    - ssh
    - sssd
    - systemd
    - timezones
    - users
    - vim
    - yum
    - open-vm-tools


  'web*.*':
    - webserver
  'db*.*':
    - mysql
  'ftp*.*':
    - vsftpd
    - vsftpd.chroot
