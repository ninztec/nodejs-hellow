#!/bin/bash

# Update package index
sudo apt-get update

# Install dependencies
sudo apt-get install -y apt-transport-https gnupg

# Add Helm GPG key
curl -fsSL https://baltocdn.com/helm/signing.asc | sudo apt-key add -

# Add Helm repository
sudo apt-add-repository -y "deb https://baltocdn.com/helm/stable/debian/ all main"

# Update package index again
sudo apt-get update

# Install Helm
sudo apt-get install -y helm
