import React, { useState, useEffect } from 'react';
import { supabase } from '../supabaseClient';
import { useAuth } from '../contexts/AuthContext';

function AdminPanel() {
  const [users, setUsers] = useState([]);
  const [posts, setPosts] = useState([]);
  const { user } = useAuth();

  useEffect(() => {
    if (user && user.role === 'admin') {
      fetchUsers();
      fetchPosts();
    }
  }, [user]);

  async function fetchUsers() {
    const { data, error } = await supabase.from('profiles').select('*');
    if (error) console.error('Error fetching users:', error);
    else setUsers(data);
  }

  async function fetchPosts() {
    const { data, error } = await supabase.from('posts').select('*');
    if (error) console.error('Error fetching posts:', error);
    else setPosts(data);
  }

  async function deleteUser(userId) {
    const { error } = await supabase.from('profiles').delete().match({ id: userId });
    if (error) console.error('Error deleting user:', error);
    else fetchUsers();
  }

  async function deletePost(postId) {
    const { error } = await supabase.from('posts').delete().match({ id: postId });
    if (error) console.error('Error deleting post:', error);
    else fetchPosts();
  }

  if (user?.role !== 'admin') {
    return <div>Access denied. Admin only.</div>;
  }

  return (
    <div>
      <h2>Admin Panel</h2>
      <h3>Users</h3>
      <ul>
        {users.map(user => (
          <li key={user.id}>
            {user.username} - {user.email}
            <button onClick={() => deleteUser(user.id)}>Delete</button>
          </li>
        ))}
      </ul>
      <h3>Posts</h3>
      <ul>
        {posts.map(post => (
          <li key={post.id}>
            {post.title} by {post.user_id}
            <button onClick={() => deletePost(post.id)}>Delete</button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default AdminPanel;
