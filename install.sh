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

# Install PM2 globally
sudo npm install -g pm2

# Clone the repository
git clone https://github.com/yourusername/onlyfans-clone.git
cd onlyfans-clone

# Install project dependencies
npm install

# Install serve for production
npm install --save serve

# Create .env file (you'll need to manually add your Supabase credentials)
cp .env.example .env

# Build the project for production
npm run build

# Run tests
npm test

# Set up PM2 to run the application
pm2 start npm --name "onlyfans-clone" -- start

# Save the PM2 process list and set up startup script
pm2 save
pm2 startup

echo "Installation complete! Please add your Supabase credentials to the .env file."
echo "The application is now running in production mode using PM2."
echo "You can monitor the application using 'pm2 monit'"
echo "To view logs, use 'pm2 logs onlyfans-clone'"
echo "To restart the application, use 'pm2 restart onlyfans-clone'"
