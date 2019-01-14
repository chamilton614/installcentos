#!/usr/bin/env bash

echo #########################################################
echo #              Uninstall OpenShift v3.11                #
echo #########################################################

[ ! -d openshift-ansible ] && git clone https://github.com/openshift/openshift-ansible.git
cd openshift-ansible && git fetch && git checkout release-${VERSION} && cd ..

#Run the uninstallation
ansible-playbook playbooks/uninstall_openshift.yaml | tee logs/openshift_uninstall.log 2>&1

echo Uninstall has been completed.