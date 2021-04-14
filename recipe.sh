echo '##################################'
echo '1- update apt'
echo '##################################'

apt update -qq

apt-get install -qq --yes --force-yes  \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  snapd

echo '##################################'
echo '2- install docker'
echo '##################################'

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo '##################################'
echo '3- install microk8s'
echo '##################################'

snap install core
snap install microk8s --classic

export PATH="$PATH:/snap/bin"

echo "alias kubectl='microk8s.kubectl'" >> ~/.bashrc

source ~/.bashrc

echo '##################################'
echo '4- configure microk8s'
echo '##################################'

microk8s.enable dns dashboard registry
microk8s.enable ingress
microk8s.add-node


#microk8s dashboard-proxy &
#microk8s config

