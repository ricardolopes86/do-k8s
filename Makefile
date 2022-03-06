master:
	ansible-playbook -i ./k8s-setup/inventory -u root --ask-become-pass ./k8s-setup/master-playbook.yml

nodes:
	ansible-playbook -i ./k8s-setup/inventory -u root ./k8s-setup/node-playbook.yml

destroy:
	terraform destroy -auto-approve

join-nodes:
	ansible-playbook -i ./k8s-setup/inventory -u root ./k8s-setup/node-playbook.yml --tags "join-command"