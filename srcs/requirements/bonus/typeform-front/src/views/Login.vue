<script setup>
import { ref, onMounted } from 'vue';
import { login } from '@/api/auth';
import { RouterLink, useRouter } from 'vue-router'
import { useTokenStore } from '@/stores/token';
import { getUser } from '@/api/user';

const email = ref('');
const password = ref('');
const error = ref('');

const router = useRouter();
const tokenStore = useTokenStore();
console.log("login token =", tokenStore.value);

const submit = async () => {
	if (!email.value || !password.value) {
		error.value = 'Please fill all fields';
		return;
	}
	error.value = '';
	const res = await login(email.value, password.value);
	email.value = '';
	password.value = '';
	if (res.error) {
		error.value = res.error;
	} else {
		await getUser();
		router.push('/dashboard');
	}
}

onMounted(() => {
	if (!tokenStore.isExpired) {
		router.push("/dashboard");
	}
});

</script>

<template>
	<div id="login">
		<div>
			<h1>Login</h1>
			<form @submit.prevent="submit">
				<input type="email" v-model="email" placeholder="Email" />
				<input type="password" v-model="password" placeholder="Password" />
				<p v-if="error" class="error">{{ error }}</p>
				<button type="submit">Login</button>
			</form>
			<RouterLink to="/register" class="link">Sign up</RouterLink>			
		</div>
	</div>
</template>

<style scoped>
#login {
	height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color: #f5f5f5;
}

#login div {
	width: 300px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	align-items: center;
}

form {
	height: 100%;
	display: flex;
	align-items: center;
	flex-direction: column;
}

input {
	margin: 5px;
	width: 200px;
	padding: 5px;
	border-radius: 5px;
}

button {
	width: 100%;
	margin: 10px;
	padding: 5px;
	color: white;
	margin-top: 10px;
	border-radius: 5px;
	background-color: black;
}

link {
	color: black;
}

.error {
	color: red;
}

</style>
