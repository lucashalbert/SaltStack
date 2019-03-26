America/New_York:
  timezone.system:
    - utc: True

America-New_York.symlink:
  file.symlink:
    - name: /etc/localtime
    - target: /usr/share/zoneinfo/America/New_York
    - force: true
    - require:
      - pkg: timezones.packages
