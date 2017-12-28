#!/bin/bash

# This script is to list ALL cron jobs for all users.

for user in $(cut -f1 -d: /etc/passwd)
do
  echo $user
  crontab -u $user -l
done
