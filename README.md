###Ansible steps:
pull image ubuntu:18.04

apt update && apt install python3 -y

test connect: ansible -i inventory all -m ping

// ansible-galaxy collection install geerlingguy.php_roles -p ./collections

ansible-galaxy install -r requirements.yml

ansible-playbook lnoad_init_playbook.yml -i inventory

(this sets up basic stuff such as sudo, bash, git, php)

ansible-playbook lnoad_playbook.yml -i inventory



notes:
- if nvm fails: edit roles/morgangraphics.ansible_role_nvm/tasks/nvm.yml , make sure {{ profile }} has ~/ in front of it
