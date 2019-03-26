/etc/yum.repos.d/webtatic.repo:
  file.managed:
    - source: salt://yum/files/webtatic.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/webtatic-archive.repo:
  file.managed:
    - source: salt://yum/files/webtatic-archive.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/webtatic-testing.repo:
  file.managed:
    - source: salt://yum/files/webtatic-testing.repo
    - user: root
    - group: root
    - mode: 644

{% set source_hash = salt['cmd.shell']('echo "md5=`curl -s "https://repo.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7" | md5sum | cut -c -32`"') %}

/etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-el7:
  file.managed:
    - source: https://repo.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7
    - skip_verify: {{ source_hash }}
    - user: root
    - group: root
    - mode: 644
