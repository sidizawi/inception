<script setup>
import { getUser, updateUser } from '@/api/user';
import { ref, onMounted } from 'vue';
import { useUserStore } from '@/stores/user';

const email = ref('');
const error = ref('');
const firstName = ref('');
const lastName = ref('');
const password = ref('');
const actualPassword = ref('');
const confirmPassword = ref('');

const userStore = useUserStore();

const submit = async () => {
	error.value = '';
	if (password.value !== confirmPassword.value) {
		error.value = 'Passwords do not match';
		return;
	}
	if (password.value && !actualPassword.value) {
		error.value = 'You must provide your actual password';
		return;
	}
	const res = await updateUser(
		firstName.value,
		lastName.value,
		password.value.length > 0 ? password.value : null,
		actualPassword.value.length > 0 ? actualPassword.value : null,
	);

	if (res.error) {
		error.value = res.error;
	}
	email.value = '';
	firstName.value = '';
	lastName.value = '';
	password.value = '';
	actualPassword.value = '';
	confirmPassword.value = '';

	let user = userStore.getUser;
	if (!user) {
		await getUser();
		user = userStore.getUser;
	}
	if (user) {
		email.value = user.email;
		firstName.value = user.firstName;
		lastName.value = user.lastName;
	}
}

onMounted(async () => {
	let user = userStore.getUser;
	if (!user) {
		await getUser();
		user = userStore.getUser;
	}
	if (user) {
		email.value = user.email;
		firstName.value = user.firstName;
		lastName.value = user.lastName;
	}
});

</script>

<template>
	<div>
		<form @submit.prevent="submit">
			<label>Firstname</label>
			<input type="text" placeholder="First name" v-model="firstName" />
			<label>Lastname</label>
			<input type="text" placeholder="Last name" v-model="lastName" />
			<label>Email</label>
			<input type="email" placeholder="Email" v-model="email" disabled />
			<label>Password</label>
			<input type="password" placeholder="Password" v-model="password" />
			<label>Confirm password</label>
			<input type="password" placeholder="Confirm password" v-model="confirmPassword" />
			<label>Actual password</label>
			<input type="password" placeholder="Actual password" v-model="actualPassword" />
			<p id="error">{{ error }}</p>
			<button type="submit">Save</button>
		</form>
	</div>
</template>

<style scoped>
div {
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

form {
	width: 400px;
	display: flex;
	flex-direction: column;
}

label {
	margin-top: 10px;
	margin-bottom: 5px;
}

input {
	padding: 5px;
	border-radius: 5px;
}

button {
	width: 100px;
	height: 30px;
	color: white;
	border-radius: 5px;
	background-color: black;
}

#error {
	color: red;
}
</style>
