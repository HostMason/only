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
git clone https://github.com/HostMason/only.git
cd only

# Install project dependencies
npm install

# Install serve for production
npm install --save serve

# Set up Supabase project
supabase init
supabase start

# Run Supabase migrations
supabase db push

# Create .env file with Supabase credentials
SUPABASE_URL=$(supabase status | grep URL | awk '{print $2}')
SUPABASE_ANON_KEY=$(supabase status | grep anon | awk '{print $5}')
echo "REACT_APP_SUPABASE_URL=$SUPABASE_URL" > .env
echo "REACT_APP_SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY" >> .env

# Build the project for production
npm run build

# Run tests
npm test

# Set up PM2 to run the application
pm2 start npm --name "onlyfans-clone" -- start

# Save the PM2 process list and set up startup script
pm2 save
pm2 startup

echo "Installation complete!"
echo "The application is now running in production mode using PM2."
echo "You can monitor the application using 'pm2 monit'"
echo "To view logs, use 'pm2 logs onlyfans-clone'"
echo "To restart the application, use 'pm2 restart onlyfans-clone'"
echo "Supabase is set up and running locally. To start/stop Supabase, use 'supabase start' and 'supabase stop'"
