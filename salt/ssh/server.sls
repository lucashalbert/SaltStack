include:
  - ssh

ssh sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - mode: 600
    - user: root
    - group: root
    - template: jinja
    - source: salt://ssh/files/sshd_config
    - require:
      - pkg: ssh.packages
