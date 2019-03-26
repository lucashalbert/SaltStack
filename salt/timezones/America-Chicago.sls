America/Chicago:
  timezone.system:
    - utc: True

America-Chicago.symlink:
  file.symlink:
    - name: /etc/localtime
    - target: /usr/share/zoneinfo/America/Chicago
    - force: true
    - require:
      - pkg: timezones.packages
