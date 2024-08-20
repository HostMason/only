# OnlyFans Clone

This project is a React-based web application that mimics some of the core functionalities of OnlyFans, using Supabase as the backend.

## System Requirements

- Ubuntu 22.04 LTS

## Installation

We provide an installer script that sets up the project environment, including Node.js, npm, Git, and the Supabase CLI. To use the installer:

1. Download the installer script:
   ```
   curl -O https://raw.githubusercontent.com/yourusername/onlyfans-clone/main/install.sh
   ```

2. Make the script executable:
   ```
   chmod +x install.sh
   ```

3. Run the installer:
   ```
   ./install.sh
   ```

4. After the installation is complete, navigate to the project directory:
   ```
   cd onlyfans-clone
   ```

5. Open the `.env` file and add your Supabase credentials:
   ```
   REACT_APP_SUPABASE_URL=your_supabase_project_url
   REACT_APP_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

6. Start the development server:
   ```
   npm start
   ```

## Manual Setup

If you prefer to set up the project manually or are using a different operating system, follow these steps:

1. Install Node.js and npm (https://nodejs.org/)
2. Install Git (https://git-scm.com/)
3. Install Supabase CLI (https://supabase.io/docs/guides/cli)
4. Clone the repository:
   ```
   git clone https://github.com/yourusername/onlyfans-clone.git
   cd onlyfans-clone
   ```
5. Install dependencies:
   ```
   npm install
   ```
6. Create a `.env` file in the root directory and add your Supabase credentials:
   ```
   REACT_APP_SUPABASE_URL=your_supabase_project_url
   REACT_APP_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```
7. Start the development server:
   ```
   npm start
   ```

## Supabase Configuration

1. Create a new project on [Supabase](https://supabase.io/).

2. Set up the following tables in your Supabase database:

   - `profiles`:
     - `id` (uuid, primary key)
     - `username` (text, unique)
     - `bio` (text)
     - `avatar_url` (text)

   - `posts`:
     - `id` (uuid, primary key)
     - `user_id` (uuid, foreign key to profiles.id)
     - `content` (text)
     - `created_at` (timestamp with time zone)

   - `subscriptions`:
     - `id` (uuid, primary key)
     - `subscriber_id` (uuid, foreign key to profiles.id)
     - `creator_id` (uuid, foreign key to profiles.id)
     - `start_date` (date)
     - `end_date` (date)

3. Set up authentication in your Supabase project and enable email/password sign-up.

## Todo List

- [ ] Implement content creation functionality
- [ ] Add subscription management features
- [ ] Integrate payment processing
- [ ] Implement feed of subscribed content creators
- [ ] Add user settings page
- [ ] Implement content search functionality
- [ ] Add messaging system between users
- [ ] Implement notifications for new content and messages
- [ ] Add content moderation features
- [ ] Implement analytics for content creators

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
