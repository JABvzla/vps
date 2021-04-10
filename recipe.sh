apt update -qq

apt-get install -qq --yes --force-yes  \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  snapd

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh


snap install core
snap install microk8s --classic

apt-get upgrade -y

export PATH="$PATH:/snap/bin"

echo "alias kubectl='microk8s.kubectl'" >> ~/.bashrc

source ~/.bashrc

microk8s.enable dns dashboard registry
microk8s.enable ingress
microk8s.add-node


#snap install kubectl --classic


#-----#

microk8s dashboard-proxy &




## install argo
#kubectl create namespace argocd
#kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
##
#kubectl get pods -n argocd | grep argocd-server
