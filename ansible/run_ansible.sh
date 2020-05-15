#!/bin/bash
set +ex

# todo genereate inventory.yml file with ec2 host
echo "all:" > inventory.yml
echo " hosts:" >> inventory.yml
echo "  \"$(cd ../infra && terraform output instance_public_ip)\":" >> inventory.yml

# todo add any additional variables
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.yml -e 'record_host_keys=True' -u ec2-user --private-key /Users/dylan/Desktop/assessment2-student-s3699661/ansible/id_rsa.pem playbook.yml