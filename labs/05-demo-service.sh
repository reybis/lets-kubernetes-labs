# Si queremos que nuestro POD de NGINX creado hace poco este disponible a otros componentes del cluster o fuera del cluster, debemos de crear un servicio que lo contenga

# Si queremos crear un servicio dentro del cluster, un clusterip para centralizar los pods
kubectl create -f clusterip-definition.yml
kubectl apply -f clusterip-definition.yml

# si queremos ampliar la información de los SERVICIOS creados, usamos el parametro -o wide
kubectl get svc -o wide

# y siu queremos toda la información del servicio, usamos el comando DESCRIBE
kubectl describe svc

# Si queremos exponer nuestra app fuera del cluster, tenemos la opción de crear un nodeport que publica uno de los puertos de todos nuestros nodos.
kubectl create -f nodeport-definition.yml
kubectl apply -f nodeport-definition.yml
kubectl get svc 
kubectl describe svc 

# Si queremos exponer nuestra app fuera del cluster, tenemos la opción de crear un load balancer, que mediante una conexión directa a nuestro cluster expone nuestra aplicación mediante un ip publico o CNAME. 
kubectl create -f loadbalancer-definition.yml
kubectl apply -f loadbalancer-definition.yml
kubectl get svc 
kubectl describe svc 
# Ojo esta opción funciona en entornos en la nube

# ahora bien para los que aman los script y los comandos como yo, tambien es posible crear un servicio sin necesidad de un YAML, incluso para cada recurso de Kubernetes hay una forma de hacerlo diferente a YAML 
# Miren lo facil que es, mediante el comando EXPOSE
kubectl expose deployment/nginx-app-deployment --type="LoadBalancer" --port 80
# usamos el parametro type para indicar el tipo de servicio, en este caso LoadBalancer
# y el puerto 80 que es el puerto donde el contenedor de NGINX de nuestro POD esta ejecutandose