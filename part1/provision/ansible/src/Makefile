all:
	ansible-playbook -i inventories/inventory ssh_fingerprints.yml
	ansible-playbook -i inventories/inventory install.yml

ssh_connection:
	ansible-playbook -i inventories/inventory ssh_fingerprints.yml

test_ansible_play:
	ansible-playbook -i inventories/inventory test_ansible_play.yml
