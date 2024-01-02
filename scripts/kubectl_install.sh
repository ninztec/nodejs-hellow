#!/bin/bash

# Download kubectl binary
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

# Make the downloaded binary executable
chmod +x kubectl

# Move kubectl to a directory in your PATH
sudo mv kubectl /usr/local/bin/

# Verify installation
kubectl version --client

