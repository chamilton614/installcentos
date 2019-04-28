#!/usr/bin/env bash

echo #########################################################
echo #              Uninstall OpenShift v3.11                #
echo #########################################################

CURRENT=$(pwd)

if [ ! -d logs ]; then
  mkdir logs
fi

if [ ! -d openshift-ansible ]; then
  git clone https://github.com/openshift/openshift-ansible.git
fi

cd openshift-ansible && git fetch && git checkout release-3.11 && cd ..

#Run the uninstallation
echo ansible-playbook -i $CURRENT/inventory.ini $CURRENT/playbooks/uninstall_openshift.yaml | tee logs/openshift_uninstall.log 2>&1
ansible-playbook -i $CURRENT/inventory.ini $CURRENT/playbooks/uninstall_openshift.yaml | tee logs/openshift_uninstall.log 2>&1

echo Uninstall has been completed.