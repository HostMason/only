# OnlyFans Clone

This project is a React-based web application that mimics some of the core functionalities of OnlyFans, using Supabase as the backend. It provides a platform for content creators to share exclusive content with their subscribers.

## Features

- User authentication (sign up, login, logout)
- User profiles
- Content creation and sharing
- Subscription management
- Feed of subscribed content creators
- Payment integration (planned)

## System Requirements

- Node.js (v14 or later)
- npm (v6 or later)
- Git
- Supabase CLI

## Installation

We provide an installer script for Ubuntu 22.04 LTS that sets up the project environment. For other operating systems, please follow the manual setup instructions.

### Automatic Installation (Ubuntu 22.04 LTS)

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

### Manual Setup

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

## Running the Application

### Development Mode

Start the development server:
```
npm run dev
```

Open your browser and navigate to `http://localhost:3000`.

### Production Mode

Build the project:
```
npm run build
```

Start the production server:
```
npm start
```

## Supabase Configuration

1. Create a new project on [Supabase](https://supabase.io/).

2. Set up the following tables in your Supabase database:

   - `profiles`: User profile information
   - `posts`: Content posts
   - `subscriptions`: Subscription relationships between users

3. Set up authentication in your Supabase project and enable email/password sign-up.

## Testing

Run the test suite:
```
npm test
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Roadmap

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

## Support

If you encounter any issues or have questions, please file an issue on the GitHub repository.
