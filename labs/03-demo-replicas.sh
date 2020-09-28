# Vamos a proceder a crear nuestro replica set en base al pod que creamos recientemente.
kubectl create -f replicaset-definition.yml
kubectl apply -f replicaset-definition.yml

# Y si queremos ver algo en Kubernetes, que usamos?
# El comando GET, en este caso para ver el replica set creado, usamos el comando GET RS, abreviatura de replica set
kubectl get rs

# si queremos ampliar la información de los replica set creados, usamos el parametro -o wide
kubectl get rs -o wide

# Sin embargo, aun nos sigue faltando información, el comando GET por lo general nos muestra la información mas basica y rapida que necesitemos
# si queremos ver toda la información del replica set, debemos usar el comando DESCRIBE, en este caso DESCRIBE RS mas el nombre del replica set 
kubectl describe rs nginx-app-rs
kubectl describe rs

# Importante, si alguna vez estas en las propiedades de YAML necesarias para crear un recurso de kubernetes
# puedes usar el comando EXPLAIN 
# Find the correct apiVersion for ReplicaSet.Run: 
kubectl explain replicaset | grep VERSION

# Bien para ver el poder de nuestros replica set, recuerden van a mantener siempre la cantidad de replicas que le hemos indicado, haremos dos pruebas
# 1 - BORRANDO UN POD para validar que mantenga la cantidad de replicas
kubectl get rs 
kubectl get pods
# Si queremos borrar algun objeto en Kubernetes, hacemos uso del comando DELETE mas el recurso, en este caso DELETE POD
kubectl delete pod <POD-name>
kubectl get rs 
kubectl get pods
# sin embargo podemos ver como recientemente se creo un pod y no fuimos nosotros, sino nuestro replicaset 
# 2 - VAMOS A ESCALAR nuestro replicaset y validar que haya creado las replicas que le hayamos indicado 
# Para escalar manualmente solo debemos ejecutar KUBECTL SCALE con la cantidad de replicas que deseamos y el nombre de nuestro replica set  
kubectl scale replicaset nginx-app-rs --replicas=4

# BORRAR replicaset 
kubectl delete rs nginx-app-rs
kubectl delete replicaset --all