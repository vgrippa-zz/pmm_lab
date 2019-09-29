curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64  \
  && install minikube-linux-amd64 /usr/local/bin/minikube \
  && minikube version


curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

minikube start --vm-driver=none
