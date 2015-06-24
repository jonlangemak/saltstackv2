base:
  '*':
    - baseinstall
{% if 'minion' in salt['pillar.get']('kube_nodes:' ~ grains['host'] ~ ':type') %}
    - minioninstall
{% elif 'master' in salt['pillar.get']('kube_nodes:' ~ grains['host'] ~ ':type') %}
    - masterinstall
    - pods
{% endif %}
