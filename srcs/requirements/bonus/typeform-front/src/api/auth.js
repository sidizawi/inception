import axios from 'axios';
import { useTokenStore } from '@/stores/token';

export const API_URL = 'http://localhost:8081/api/';

export const login = async (email, password) => {
	const path = API_URL + 'v1/login/';
	try {
		const response = await axios.post(path, {
			email: email,
			password: password,
		});
		const tokenStore = useTokenStore();
		if (response.data.token) {
			tokenStore.setToken(response.data.token);
		}
	} catch (error) {
		return { error: error.response.data.message };
	}
	return { error: false };
}

export const logout = () => {
	const tokenStore = useTokenStore();
	tokenStore.setToken('');
}
