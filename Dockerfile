FROM jenkins/jenkins:latest

USER root

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# Agregar la clave GPG oficial de Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Agregar el repositorio de Docker a las fuentes de APT
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

# Instalar Docker CLI
RUN apt-get update && \
    apt-get -y install docker-ce-cli

RUN groupadd -g 994 docker

# Añadir el usuario jenkins al grupo docker
RUN usermod -aG docker jenkins

# --- Agregar kubectl ---

# Descargar e instalar kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Verificar la instalación de kubectl
RUN kubectl version --client

# Cambiar de vuelta al usuario jenkins
USER jenkins