import axios from 'axios';
import { useUserStore } from '@/stores/user';
import { useTokenStore } from '@/stores/token';

import { API_URL } from './auth';

export const getUser = async () => {
	const path = API_URL + 'v1/user/';
	try {
		const token = useTokenStore().value;
		if (!token) {
			return { error: 'No token' };
		}
		const response = await axios.get(path, {
			headers: {
				Authorization: 'Bearer ' + token,
			}
		});
		const userStore = useUserStore();
		userStore.setUser(response.data.user);
	} catch (error) {
		return { error: error.response.data.message };
	}
	return ({ error: false });
}

export const createUser = async (email, password, firstName, lastName) => {
	const path = API_URL + 'v1/user/';
	try {
		const response = await axios.post(path, {
			email: email,
			password: password,
			first_name: firstName,
			last_name: lastName,
		});
		const userStore = useUserStore();
		const tokenStore = useTokenStore();
		if (response.data.user) {
			userStore.setUser(response.data.user);
		}
		if (response.data.token) {
			tokenStore.setToken(response.data.token);
		}
	} catch (error) {
		const message = error.response.data.message;
		if (typeof message === 'string') {
			return { error: message };
		}
		return { error: message[0] };
	}
	return { error: false };
};

export const updateUser = async (firstName, lastName, password, actualPassword) => {
	const path = API_URL + 'v1/user/';
	try {
		const token = useTokenStore().value;
		if (!token) {
			return { error: 'No token' };
		}
		console.log('updateUser', firstName, lastName, password, actualPassword);
		const response = await axios.put(path, {
			first_name: firstName,
			last_name: lastName,
			password: password,
			actual_password: actualPassword,
		}, {
			headers: {
				Authorization: 'Bearer ' + token,
			}
		});
		const userStore = useUserStore();
		userStore.setUser(response.data.user);
	} catch (error) {
		const message = error.response.data.message;
		if (typeof message === 'string') {
			return { error: message };
		}
		return { error: message[0] };
	}
	return ({ error: false });
}
