include:
  - firewalld.enabled

saltmaster:
  firewalld.service:
    - name: saltmaster
    - ports:
      - 4505/tcp
      - 4506/tcp

saltzone:
  firewalld.present:
    - name: saltzone
    - services:
      - saltmaster
    - sources:
{% for saltmaster, ip in pillar.get('saltmasters', {}).items() %}
      - {{ ip }}
{% endfor %}
