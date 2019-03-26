/usr/lib64/nagios/plugins:
  file.recurse:
    - source: salt://nagios/files/plugins
    - user: root
    - group: root
    - dir_mode: 775 
    - file_mode: 755
    - include_empty: True
    - require:
      - pkg: nagios-plugins.packages
