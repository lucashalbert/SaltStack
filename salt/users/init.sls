include:

{% for name, user in pillar.get('users', {}).items() if user.absent is not defined or not user.absent %}

{%- if user == None -%}
{%- set user = {} -%}
{%- endif -%}
{%- set user_files = salt['pillar.get'](('users:' ~ name ~ ':user_files'), { 'enabled': False}) -%}
{%- set home = user.get('home', "/home/%s" %name) -%}
{%- set user_group = name -%}

# Build Groups
{% for group in user.get('groups', []) %}
users_{{ name }}_{{ group }}_group:
  group:
    - name: {{ group }}
    - present
{% endfor %}

users_{{ name }}_user:
  {% if user['gid'] is not defined %}
  group.present:
    - name: {{ user_group }}
    - gid: {{ user['uid'] }}
  {% endif %}
  user.present:
    - name: {{ name }}
    - home: {{ home }}
    - shell: {{ user['shell'] }}
    - uid: {{ user['uid'] }}
    {% if user['gid'] is defined %}
    - gid: {{ user['gid'] }}
    {% else %}
    - gid: {{ user['uid'] }}
    {% endif %}
    - password: {{ user['password'] }}
    - fullname: {{ user['fullname'] }}
    {% if user['unique'] is defined %}
    - unique: {{ user['unique'] }}
    {% endif %}
    - groups:
#      - {{ user_group }}
      {% for group in user.get('groups', []) %}
      - {{ group }}
      {% endfor %}
    {% if user['allow_uid_change'] is defined %}
    - allow_uid_change: {{ user['allow_uid_change'] }}
    {% endif %}
    {% if user['allow_gid_change'] is defined %}
    - allow_gid_change: {{ user['allow_gid_change'] }}
    {% endif %}

{% if 'ssh_auth' in user %}
{% for auth in user['ssh_auth'] %}
users_ssh_auth_{{ name }}_{{ loop.index0 }}:
  ssh_auth.present:
    - user: {{ name }}
    - name: {{ auth }}
{% endfor %}
{% endif %}

{% if user_files.enabled %}
vimrc_{{ name }}:
  file.managed:
    - name: {{ home }}/.vimrc
    - source: salt://users/files/.vimrc

bash_config_{{ name }}:
  file.managed:
    - name: {{ home }}/.bashrc
    - source: salt://users/files/.bashrc
    - require:
      - user: {{ name }}

{% endif %}

{% endfor %}
