php7-packages:
  pkg.installed:
    - pkgs:
      - php70w
      - php70w-ldap
      - php70w-pear
      - php70w-bcmath
      - php70w-cli
      - php70w-devel
      - php70w-mcrypt
      - php70w-soap
      - php70w-pdo
      - php70w-xml
      - php70w-process
      - php70w-opcache
      - php70w-gd
      - php70w-common
      - php70w-mbstring
      - php70w-mysqlnd

disable-phpinfo-function:
  file.line:
    - name: /etc/php.ini
    - match: "^disable_functions =$"
    - content: "disable_functions = phpinfo"
    - mode: replace
    - show_changes: True

/bin/systemctl restart httpd.service:
  cmd.run
