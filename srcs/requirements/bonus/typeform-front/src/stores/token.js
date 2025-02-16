import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useTokenStore = defineStore('token', () => {
  const token = ref(localStorage.getItem('token') || '');
  const tokenExpiry = ref(localStorage.getItem('tokenExpiry') || null);

  const value = computed(() => token.value);
  const isExpired = computed(() => {
    // console.log('token', token.value, 'expir', tokenExpiry.value);
    return !token.value || (tokenExpiry.value ? Date.now() > tokenExpiry.value : true);
  });

  const setToken = (data) => {
    if (!data) {
      localStorage.removeItem('token');
      localStorage.removeItem('tokenExpiry');
      token.value = null;
      tokenExpiry.value = null;
    } else {
      token.value = data;
      localStorage.setItem('token', data);
      const exp = getExpiration(data);
      tokenExpiry.value = exp;
      localStorage.setItem('tokenExpiry', exp);
    }
  }

  const getExpiration = (data) => {
    try {
      const payload = JSON.parse(atob(data.split(".")[1]));
      return payload.exp ? payload.exp * 1000 : null;
    } catch (error) {
      console.error("Invalid token format", error);
      return null;
    }
  }

  return { value, isExpired, setToken };
})
