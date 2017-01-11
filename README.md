
Installer RVM, Ruby et ses extensions sur Linux:
sudo apt-get update
\curl -L https://get.rvm.io | bash -s stable --rails


Installer Vagrant:
sudo dpkg -i vagrant_1.9.1_x86_64.deb

Récupérer le projet sur GitHub:
git clone https://github.com/MassAG/Cloud_app.git

Installation de tous les gem :
source ~/.rvm/scripts/rvm
bundle install

Création de la base de données :
rake db:migrate

Lancement de serveur :
rails server

Puis aller sur http://localhost:3000/ .
