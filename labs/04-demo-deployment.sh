# Vamos a proceder a crear nuestro deployment en base al replica set que creamos recientemente.

kubectl create -f deployment-definition.yml
kubectl apply -f deployment-definition.yml

# Y si queremos ver algo en Kubernetes, que usamos?
# El comando GET, en este caso para ver los deployments creados, usamos el comando GET deployment
kubectl get deployments

# si queremos ampliar la información de los deployment creados, usamos el parametro -o wide
kubectl get deployments -o wide

# ahora veamos todo lo que creo el deployment por nosotros
kubectl get all

# Sin embargo, aun nos sigue faltando información, el comando GET por lo general nos muestra la información mas basica y rapida que necesitemos
kubectl describe deployments
# Aqui podemos ver que nuestro deployment internamente crea un replica set mas los POD, todo automaticamente.

# Podemos validarlo
kubectl get rs -o wide

# Bien para ver el poder de nuestros deployment, haremos varias pruebas
# 1 - BORRANDO UN POD para validar que mantenga la cantidad de replicas
kubectl get deployment 
kubectl get pods
kubectl delete pod <POD-name>
kubectl get pods -o wide
# sin embargo podemos ver como recientemente se creo un pod y no fuimos nosotros, sino el deployment mediante el replica set que inicialmente creo 
kubectl get deployment 

# 2 - VAMOS A ESCALAR nuestro deployment y validar que haya creado las replicas que le hayamos indicado 
# Para escalar manualmente solo debemos ejecutar KUBECTL SCALE con la cantidad de replicas que deseamos y el nombre de nuestro deployment
kubectl scale deployment/nginx-app-deployment --replicas=4

# 3 - Y POR ULTIMO, vamos a actualizar uno de los contenedores de nuestros POD, en otras palabras a actualizar nuestra aplicación y verificar que la aplicación siga operativa, para esto haremos uso del comando SET IMAGE
kubectl set image deployment/nginx-app-deployment nginx=nginx:1.9.1

# Para verificar el estatus de la actualización usamos el comando rollout status
kubectl rollout status deployment/nginx-app-deployment

# Para verificar el historico de actualización usamos el comando rollout history
kubectl rollout history deployment/nginx-app-deployment

# bien, todo parece bien, pero ahora imaginemos que algo sale mal, actualizare nuevamente pero con una imagen erronea
kubectl set image deployment/nginx-app-deployment nginx=busybox

# Vemos que se ha actualizado el historico, sin embargo algo anda mal
kubectl rollout history deployment/nginx-app-deployment

kubectl describe pods -l app=nginx-app

# vemos como algo anda mal, pues hagamos rollback o UNDO
kubectl rollout status deployment/nginx-app-deployment

kubectl rollout undo deployment/nginx-app-deployment
