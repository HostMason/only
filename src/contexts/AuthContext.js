import React, { createContext, useState, useContext, useEffect } from 'react';
import { supabase } from '../supabaseClient';

const AuthContext = createContext();

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);

  useEffect(() => {
    const session = supabase.auth.session();
    setUser(session?.user ?? null);
    if (session?.user) {
      fetchUserRole(session.user.id);
    }

    const { data: listener } = supabase.auth.onAuthStateChange(
      async (event, session) => {
        const currentUser = session?.user ?? null;
        setUser(currentUser);
        if (currentUser) {
          fetchUserRole(currentUser.id);
        }
      }
    );

    return () => {
      listener?.unsubscribe();
    };
  }, []);

  async function fetchUserRole(userId) {
    const { data, error } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', userId)
      .single();

    if (error) {
      console.error('Error fetching user role:', error);
    } else if (data) {
      setUser(prevUser => ({ ...prevUser, role: data.role }));
    }
  }

  const value = {
    signUp: async (email, password, username) => {
      const { user, error } = await supabase.auth.signUp({ email, password });
      if (user) {
        await supabase.from('profiles').insert({ id: user.id, username, role: 'user' });
      }
      return { user, error };
    },
    signIn: (email, password) => supabase.auth.signIn({ email, password }),
    signOut: () => supabase.auth.signOut(),
    user,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  return useContext(AuthContext);
}
