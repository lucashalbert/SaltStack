users:
  toor:
    fullname: toor superuser
    uid: 0
    gid: 0
    shell: /bin/bash
    password: 
    home: /root
    unique: False

  username-r:
    fullname: username root
    uid: 0
    gid: 0
    shell: /bin/bash
    password: 
    home: /root
    unique: False
      
  username:
    fullname: username
    uid: 1001
    gid: 100
    allow_uid_change: True
    allow_gid_change: True
    shell: /bin/bash
    password: 
    ssh_auth:
      - ssh-rsa 
    groups:
      - wheel
      - users
    user_files:
      enabled: true
      
