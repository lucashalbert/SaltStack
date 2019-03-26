America/Los_Angeles:
  timezone.system:
    - utc: True

America-Los_Angeles.symlink:
  file.symlink:
    - name: /etc/localtime
    - target: /usr/share/zoneinfo/America/Los_Angeles
    - force: true
    - require:
      - pkg: timezones.packages
