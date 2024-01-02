#!/bin/bash

# Install prerequisites
sudo apt-get update
sudo apt-get install -y curl

# Download Kind binary
KIND_VERSION="v0.20.0" # Change this to the latest version if needed
curl -Lo ./kind https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Verify installation
kind version
