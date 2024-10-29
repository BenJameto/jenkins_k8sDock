# Descripcion:

&nbsp;

Este es un ejercicio basico para comprender la metodologia CI/CD (*Despliegue e Integracion Continua, por sus siglas en ingles *Continuous Integration*/*Continuos Deployment*).

## Prerrequisitos(Se recominda para una funcionalidad correcta):

- Min. 2Gb RAM & 2 CPU's 
- 20G de espacio libre en disco
- Se necesita la previa instalacion de Virtual Box o Docker #se recomienda Docker para su uso en Debian.

&nbsp;

## Instalacion de minikube:

Seguir los pasos del ticket **Instalar Minikube**

&nbsp;

## Despliegue de Jenkins

1. Clonar el repositorio
```
git@github.com:BenJameto/jenkins_k8sDock.git
```

2. Aplicar el archivo jenkins-custom-deployment.yaml
```
kubectl apply -f jenkins-custom-deployment.yaml 
```
2.1. Aplicar el archivo jenkins-clusterrole.yaml
2.2. Aplicar el archivo jenkins-clusterrolebinding.yaml

```
kubectl apply -f <archivo-correspondiente>.yaml
```
3. Acceder a la interfaz de Jenkins
```
http://<Minikube_IP>:30000
```
Para obtener la ip se ejecuta
```
minikube ip

```
**Nota:** el usuario default de Jenkins es **admin** y el password se genera utilizando el comando:
```
kubectl exec --namespace jenkins -it <nombre-del-pod-de-jenkins> -- cat /var/jenkins_home/secrets/initialAdminPassword
```
**Nota 2:** los archivos adicionales solo son configuraciones para que Jenkins pueda controlar recursos en Kubernetes, como gestionar deployments o interactuar con pods y services, en el enfoque CI/CD.
