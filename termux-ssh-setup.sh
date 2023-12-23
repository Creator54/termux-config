#!/usr/bin/env bash

pkg update -y && pkg upgrade -y

pkg install openssh -y

passwd

ssh-keygen -A

sshd
