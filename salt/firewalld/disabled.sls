# Enable firewalld
/bin/systemctl disable firewalld.service:
  cmd.run

# Start firewalld
/bin/systemctl stop firewalld.service:
  cmd.run
