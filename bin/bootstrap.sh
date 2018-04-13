#!/bin/bash

# Things that we need to install when first on a system:
#   - python
#     - python on a mac
#     - python-pip on debian
#   - ansible
#     - from pip
#   - vcsh
#   - git
# Update pip and setuptools:
#   pip install --upgrade pip setuptools # this will need to be run with sudo on debian
# The next step is to run: 
#   vcsh clone git@github.com:cwndrws/dotfiles.git dotfiles
# then run
#   cd ~/.config/playbook && ansible-playbook -i inventory.yml site.yml
