# Let's Kubernetes Labs

Este repositorio incluye los laboratorios realizados durante el seminario web Let's Kubernetes.

## Requisitos

- Cluster de Kubernetes
  - Oracle Cloud
    
    [Oracle OKE - Oracle Container Engine for Kubernetes
](https://www.oracle.com/cloud/compute/container-engine-kubernetes.html)
  - Microsoft Azure
  
    [Azure - Azure AKS - Azure Kubernetes Service
](https://azure.microsoft.com/es-es/services/kubernetes-service/)
  - [Katacoda](https://www.katacoda.com/courses/kubernetes/playground)
  - [Play with K8s](https://labs.play-with-k8s.com/)
  - [Minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/)
  - [microk8s](https://microk8s.io/)
  - [k3s](https://k3s.io/)
- [Kubectl](https://kubernetes.io/es/docs/tasks/tools/install-kubectl/)

## Estructura
```
.
readme.md
license.md
labs
  ├── 01-demo-cluster.sh
  ├── 02-demo-pod.sh
  ├── 03-demo-replicas.sh
  ├── 04-demo-deployment.sh
  └── 05-demo-service.sh
specs
  ├── pod-definition.yml
  ├── replicaset-definition.yml
  ├── deployment-definition.yml
  ├── clusterip-definition.yml
  ├── loadbalancer-definition.yml
  └── nodeport-definition.yml
```

## ¿Como Iniciar?

### Sigue las instrucciones 
En la carpeta de **labs**.

## Changelog

#### 1.0.0 - Release Inicial