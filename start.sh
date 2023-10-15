#!/bin/bash

sudo whoami
ansible-galaxy collection install community.general
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml
