# Vamos a crear un pod de NGINX, para esto usaremos el comando RUN
# Anteriormente este comando creaba un objeto diferente de Kubernetes llamado DEPLOYMENT, pero en las versiones mas recientes de Kubernetes solo crea PODS
kubectl run nginx --image nginx

# Y si queremos ver algo en Kubernetes, que usamos?
# El comando GET, en este caso para ver los pods creados, usamos el comando GET PODS
kubectl get pods

# si queremos ampliar la información de los PODS creados, usamos el parametro -o wide
kubectl get pods -o wide

# Sin embargo, aun nos sigue faltando información, el comando GET por lo general nos muestra la información mas basica y rapida que necesitemos
# Pero si queremos ver toda la información de un objeto de Kubernetes, debemos usar el comando DESCRIBE, en este caso DESCRIBE POD
kubectl describe pod nginx

# Bien, como les habia comentado, los PODS se ejecutan en una red privada aislada, por lo que necesitamos crear un proxy entre cluster y nuestra maquina.

# OJO luego veremos como se expone nuestra aplicación al publico, mientras accederemos internamente.

# Para hacer esto, no es necesario que creemos un servidor proxy o algo muy complicado, ya kubectl incluye un servidor proxy que hace todo esto tan sencillo como ejecutar KUBECTL PROXY
kubectl proxy --address=0.0.0.0

# En este caso estoy usando una propiedad que permite que pueda acceder al proxy desde cualquier lugar

# Ya con el proxy activo, podemos verificar si el proxy funciona, accediendo al API SERVER de nuestro cluster, este API SERVER esta publicado por default en el puerto 8001.

# asi que al hacer una petición HTTP con el comando CURL
curl http://localhost:8001/version

# Sin embargo para ver nuestro pod, tenemos que hacer una petición al API de los PODS
curl http://localhost:8001/api/v1/namespaces/default/pods/nginx/proxy/

# Otra manera de acceder a nuestro POD, es mediante el comando exec
# Solo tenemos que indicarle el nombre de nuestro POD y el contenedor donde queremos ejecutar el comando, por ejemplo.
kubectl exec nginx -c nginx curl localhost

# Si nuestro POD solo tiene un solo contenedor, no es necesario especificarlo
kubectl exec nginx curl localhost

# EXEC nos permite ejecutar cualquier comando en el o los contenedores de nuestros PODS
# Incluso si queremos entrar a uno de los contenedores POD via consola/shell, usando EXEC
kubectl exec -it nginx bash

# El parametro IT, significa interactivo, lo que permite

# ----- VUELVE A LA PRESENTACION

cd /vagrant_data/webinar/demos/

# Bien ya sabiendo lo que son los archivos de definicion YAML, como creamos nuestro POD desde YAML?
# Facil, hacemos uso de dos comando, el que mas nos guste
kubectl create -f pod-definition.yml
kubectl apply -f pod-definition.yml
# la diferencia mas importante de uno y de otro, es que create primero borra los recursos que ya existan con el mismo nombre que el del archivo de definición y luego procede a crear el recurso, 
# en este caso el POD especificando en el parametro f, el archivo de definition

# luego de esto podemos ver nuestro pod
kubectl get pod -o wide
# y vemos que el mismo se creo recientemente
kubectl delete pod nginx nginx-app