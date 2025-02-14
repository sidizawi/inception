<script setup>
import { RouterLink } from 'vue-router'
import Logo from '@/components/Logo.vue'
import ButtonLink from '@/components/ButtonLink.vue'
</script>

<template>
	<nav>
		<RouterLink to="/">
			<Logo />
		</RouterLink>
		<div>
			<!-- <RouterLink to="/login">Login</RouterLink> -->
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

</style>
