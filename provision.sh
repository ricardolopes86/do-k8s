#!/bin/bash
terraform plan && terraform apply -auto-approve

retVal=$?

if [ $retVal -eq 0 ]; then
    make master && make nodes
fi

retVal=$?
if [ $retVal -eq 0 ]; then
    controlplaneIP=$(cat ./k8s-setup/inventory | sed -n 2p)
    scp root@${controlplaneIP}:/etc/kubernetes/admin.conf .
fi

exit $retVal