{# Create default vars dictionary #}
{% set vars = {'timezone': None} %}

{# iterate through all defined timezones and test if host belongs #}
{% for timezone, hosts in salt['pillar.get']('timezones', {}).iteritems() %}
  {% if grains['id'] in hosts %}
    {# update dictionary item vars.timezone to value of timezone #}
    {% if vars.update({'timezone': timezone}) %} {% endif %}
  {% endif %}
{% endfor %}

include:
  - timezones.installed
{# check if dictionary item vars.timezone is not 'None' #}
{% if vars.timezone != None %}
  - timezones.{{ vars.timezone }}
{% else %}
  - timezones.America-New_York
{% endif %}


restart_crond:
  cmd.run:
    - name: /bin/systemctl restart crond.service
