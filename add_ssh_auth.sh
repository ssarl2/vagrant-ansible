#! /usr/bin/env bash

#create ssh key
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.1.11
# sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.1.12
# sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.1.13
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.1.14
# sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.1.15
# sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.1.16

# sshpass provides a variety of features to use ssh password
# -p is password
# -T is not to assign pseudo-tty when running
# -o is option
# StrictHostKeyChecking=no is to run without user's permit