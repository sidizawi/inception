<script setup>
import { ref, onMounted } from 'vue'
import { RouterLink, useRouter } from 'vue-router'
import { useTokenStore } from '@/stores/token'

import Logo from '@/components/Logo.vue'
import ButtonLink from '@/components/ButtonLink.vue'

const router = useRouter();
const loggedIn = ref(false);

onMounted(() => {
	loggedIn.value = !useTokenStore().isExpired;
});

</script>

<template>
	<nav>
		<RouterLink to="/">
			<Logo />
		</RouterLink>
		<div v-if="loggedIn">
			<div id="profile" @click="() => router.push('/dashboard')" type="button">
				<i class="pi pi-user"></i>
			</div>
			<ButtonLink link="/logout" name="Log out" primary />
		</div>
		<div v-else>
			<ButtonLink link="/login" name="Log in" />
			<ButtonLink link="/register" name="Sign up" primary />
		</div>
	</nav>
</template>

<style scoped>
nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 60px;
	background-color: white;
	position: fixed;
	top: 0;
	padding-left: 20px;
	padding-right: 20px;
	width: 100%;
	z-index: 1000;
}

nav div {
	display: flex;
	display: space-evenly;
	margin-right: 30px;
}

#profile {
	margin: 8px;
	font-size: 1.3em;
	/* margin-right: 10px; */
	width: 30px;
	height: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	border: 2px solid black;
}
</style>
