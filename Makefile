IMAGE := alpine/fio
APP:="scripts/usernetes-containerd.sh"

deploy-minikube-kubectl-helm-latest:
	bash app/deploy-minikube-kubectl-helm-latest.sh

provision-helm:
	bash app/provision-helm.sh

provision-kubectl:
	bash app/provision-kubectl.sh

provision-minikube:
	bash app/provision-minikube.sh

deploy-minikube-latest:
	bash app/deploy-minikube_latest.sh

deploy-minikube:
	bash app/deploy-minikube.sh
	
deploy-cakephp:
	bash scripts/deploy-cakephp.sh

provision-bash-jenkins-ubuntu:
	bash scripts/provision-bash-jenkins-ubuntu.sh

deploy-boxes:
	bash scripts/deploy-boxes.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

deploy-packer:
	bash scripts/deploy-packer.sh

deploy-terraform:
	bash scripts/deploy-terraform.sh
	
push-image:
	docker push $(IMAGE)

.PHONY: deploy-libvirt deploy-vagrant deploy-packer deploy-terraform push-image
