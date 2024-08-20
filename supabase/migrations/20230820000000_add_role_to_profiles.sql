-- Add role column to profiles table
ALTER TABLE profiles ADD COLUMN role TEXT NOT NULL DEFAULT 'user';

-- Create admin user (replace 'admin@example.com' with the desired admin email)
INSERT INTO auth.users (email, encrypted_password, email_confirmed_at, role)
VALUES ('admin@example.com', crypt('admin_password', gen_salt('bf')), now(), 'authenticated');

INSERT INTO public.profiles (id, username, role)
VALUES ((SELECT id FROM auth.users WHERE email = 'admin@example.com'), 'admin', 'admin');
