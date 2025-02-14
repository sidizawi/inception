<script setup>
import { ref } from 'vue';

const email = ref('');
const password = ref('');

const login = () => {
	console.log(email.value);
	email.value = '';
	password.value = '';
}

</script>

<template>
	<div class="login">
		<h1>Login</h1>
		<form @submit.prevent="login">
			<div class="elem">
				<label for="email">Email</label>
				<input type="email" v-model="email" placeholder="Email" />
			</div>
			<div class="elem">
				<label for="password">Password</label>
				<input type="password" v-model="password" placeholder="Password" />
			</div>
			<button type="submit">Login</button>
		</form>
	</div>
</template>

<style scoped>
.login {
	margin: auto;
	display: flex;
	align-items: center;
	flex-direction: column;
}

.elem {
	height: 20%;
	width: 100%;
	padding: 10px;
	display: flex;
	align-items: left;
	flex-direction: column;
	justify-content: space-between;
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

</style>
