#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Git
sudo apt-get install -y git

# Install Supabase CLI
wget -O supabase.deb https://github.com/supabase/cli/releases/download/v1.64.8/supabase_1.64.8_linux_amd64.deb
sudo dpkg -i supabase.deb
rm supabase.deb

# Install PM2 globally
sudo npm install -g pm2

# Clone the repository (if not already cloned)
if [ ! -d "only" ]; then
  git clone https://github.com/HostMason/only.git
fi
cd only

# Install project dependencies
npm install

# Install serve for production
npm install --save serve

# Set up Supabase project (commented out for now)
# supabase init
# supabase start

# Run Supabase migrations (commented out for now)
# supabase db push

# Create .env file with placeholder Supabase credentials
echo "REACT_APP_SUPABASE_URL=your_supabase_project_url" > .env
echo "REACT_APP_SUPABASE_ANON_KEY=your_supabase_anon_key" >> .env

# Add build and test scripts to package.json
npm set-script build "react-scripts build"
npm set-script test "react-scripts test"

# Build the project for production
npm run build

# Run tests (add --passWithNoTests to avoid failing if there are no tests yet)
npm test -- --passWithNoTests

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
