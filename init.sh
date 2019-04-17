#/bin/bash
alias -p mke="./minikube.exe"
alias -p k="./kubectl.exe"
k -n default exec -it $(k get pod -l io.kompose.service=db -o jsonpath='{.items[0].metadata.name}') -- mysql -u root -proot < i4_gestion/database/gestion_produits.sql
