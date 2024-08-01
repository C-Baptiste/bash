#!/bin/bash

ssh ...@... <<EOF1
hostname
ssh ...@... <<EOF2
sudo -S <<<"..." ls /etc
EOF2
EOF1

ssh -t ...@... "sudo -S ls /etc"
shc -f test.sh -o test.sh.x
