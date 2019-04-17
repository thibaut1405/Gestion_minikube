# Gestion_minikube

## Ceci s'exécute sur windows ##

J'ai utilisé pour réaliser ce TP : minikube pour windows et MobaXterm et VirtualBox


J'ai donc créé les alias avec les commandes :
	- alias -p k="./kubectl.exe"
	- alias -p mke="./minikube.exe"

Il faut ensuite faire :
	- mke start (cela peut prendre un peu de temps)
	
Ensuite il faut faire :
	- k create -f db-deployment.yaml
	- k create -f website-deployment.yaml
	- k create -f minio-deployment.yaml
	
Il ne reste plus qu'a ajouter la base de données sur le conteneur avec cette commande:

k -n default exec -it $(k get pod -l io.kompose.service=db -o jsonpath='{.items[0].metadata.name}') -- mysql -u root -proot < gestion_produits.sql

Pour ce qui est de la scalabilité horizontal dans kubernetes est intégré une option qui permet de le gérer automatiquement. 
Pour cela il suffit de définir les replicas avec un minimum et un maximum avec des règles sur les metrics comme les CPU utilisé ou la mémoire.
Je n'ai pas réussi à mettre en place ceci.