#!/bin/sh
if [ -z "$1" ]
then
      echo " kubernetes Master Node name or IP Address is missing , pass it as parameter"
      exit
else
	echo "installing Docker and Kubernetes cluster on $1"
	ansible-playbook k8sDeployment.yml --extra-vars "target=$1"	
	echo "downloading kubectl..."
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

	echo "installing kubectl..."
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
	echo "copying configuration file from kubernetest master server: $1..."
	mkdir -p $HOME/.kube
	scp root@$1:/etc/kubernetes/admin.conf $HOME/.kube/config
	chown $(id -u):$(id -g) $HOME/.kube/config
	echo "kubectl configured to work for kubernetest cluster with master node: $1...."
	echo "deploying solution on Kubernetes..."
	kubectl apply -f solutions-deployment-yml/.
fi
