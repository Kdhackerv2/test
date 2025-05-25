#!/bin/bash

# Exit if any command fails
set -e

echo "Installing dependencies..."
sudo apt install -y apt-transport-https curl gnupg

echo "Adding Elastic GPG key..."
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic-keyring.gpg

echo "Adding Elastic APT repository..."
echo "deb [signed-by=/usr/share/keyrings/elastic-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

echo "Updating package list..."
sudo apt update

echo "Done. You're ready to install Elasticsearch, Logstash, and Kibana."
