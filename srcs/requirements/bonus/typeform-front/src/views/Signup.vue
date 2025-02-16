<script setup>
import { ref, onMounted } from 'vue';
import { RouterLink, useRouter } from 'vue-router'
import { useTokenStore } from '@/stores/token';
import { createUser } from '@/api/user';

const email = ref('');
const error = ref('');
const lastName = ref('');
const password = ref('');
const firstName = ref('');
const passwordConfirm = ref('');

const router = useRouter();
const tokenStore = useTokenStore();

const submit = async () => {
	error.value = '';
	if (password.value != passwordConfirm.value) {
		error.value = 'Passwords do not match';
		return;
	}
	if (email.value == '' || password.value == '' || firstName.value == '' || lastName.value == '') {
		error.value = 'All fields are required';
		return;
	}
	const res = await createUser(email.value, password.value, firstName.value, lastName.value)
	email.value = '';
	password.value = '';
	firstName.value = '';
	lastName.value = '';
	passwordConfirm.value = '';
	if (res.error) {
		error.value = res.error;
	} else {
		router.push('/dashboard');
	}
}

onMounted(() => {
	if (!tokenStore.isExpired) {
		router.push('/dashboard');
	}
});

</script>

<template>
	<div id="signup">
		<div>
			<h1>Sign up</h1>
			<form @submit.prevent="submit">
				<input type="text" v-model="firstName" placeholder="First name" />
				<input type="text" v-model="lastName" placeholder="Last name" />
				<input type="email" v-model="email" placeholder="Email" />
				<input type="password" v-model="password" placeholder="Password" />
				<input type="password" v-model="passwordConfirm" placeholder="Password" />
				<p v-if="error" class="error">{{ error }}</p>
				<button type="submit">Sign up</button>
			</form>
			<RouterLink to="/login" class="link">Login in</RouterLink>			
		</div>
	</div>
</template>

<style scoped>
#signup {
	height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color: #f5f5f5;
}

#signup div {
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
