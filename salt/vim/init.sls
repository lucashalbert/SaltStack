include:
  - vim.installed

# set system-wide vimrc
/etc/vimrc:
  file.managed:
    - source: salt://vim/files/vimrc
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: vim.packages
  
