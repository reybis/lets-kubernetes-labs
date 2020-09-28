vagrant up

# Lo primero es verificar que tengamos instalado kubectl y que este configurado
kubectl version

# Luego verificamos la información referente a nuestro cluster
kubectl cluster-info

# Al validar esto, procedemos a ver nuestros nodos, recuerdan.
kubectl get nodes

# Para ver una información mas amplia podemos utilizar el parametro -o wide
kubectl get nodes -o wide
