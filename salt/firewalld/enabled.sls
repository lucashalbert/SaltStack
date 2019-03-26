# Enable firewalld
/bin/systemctl enable firewalld.service:
  cmd.run

# Start firewalld
/bin/systemctl start firewalld.service:
  cmd.run
