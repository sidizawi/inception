<script setup>
import { onMounted } from 'vue';
import { useTokenStore } from '@/stores/token';
import { useRouter, useRoute, RouterView } from 'vue-router';

import Footer from '@/components/Footer.vue';
import Header from '@/components/Header.vue';

const route = useRoute();
const router = useRouter();
const tokenStore = useTokenStore();

onMounted(() => {
	if (tokenStore.isExpired) {
		tokenStore.setToken(null);
		router.push('/login');
	}
	if (route.path == '/dashboard' || route.path == '/dashboard/') {
		router.push('/dashboard/profile');
	}
});

</script>

<template>
	<Header logged-in />
	<main>
		<RouterView />
	</main>
	<Footer />
</template>


<style scoped>
main {
	margin-top: 60px;
	height: calc(100vh - 130px);
	background-color: #f5f5f5;
}
</style>
