/opt/chroot/home:
  file.directory:
    - user: root
    - group: users
    - mode: 6750
    - makedirs: False

ftp-sftp-chroot-user-acl:
  acl.present:
    - name: /opt/chroot/home
    - acl_type: default:user
    - acl_name: root
    - perms: rwx

ftp-sftp-chroot-group-acl:
  acl.present:
    - name: /opt/chroot/home
    - acl_type: default:group
    - acl_name: users
    - perms: rx
