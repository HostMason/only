#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Git
sudo apt-get install -y git

# Install Supabase CLI
curl -fsSL https://github.com/supabase/cli/releases/latest/download/supabase_linux_amd64.deb -o supabase.deb
sudo dpkg -i supabase.deb
rm supabase.deb

# Clone the repository
git clone https://github.com/yourusername/onlyfans-clone.git
cd onlyfans-clone

# Install project dependencies
npm install

# Create .env file (you'll need to manually add your Supabase credentials)
cp .env.example .env

echo "Installation complete! Please add your Supabase credentials to the .env file."
