authconfig:
  pkg.installed:
    - name: authconfig

authconfig_apply:
  cmd.run:
    - name: /usr/sbin/authconfig --enablesssd --enablesssdauth --enablelocauthorize --enableldap --enableldapauth --enablemkhomedir --update
    - unless: /usr/bin/test "`/usr/sbin/authconfig --enablesssd --enablesssdauth --enablelocauthorize --enableldap --enableldapauth --enablemkhomedir --update --test`" = "`/usr/sbin/authconfig --test"`
