<script setup>
import { onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { useTokenStore } from '@/stores/token';
import { useUserStore } from '@/stores/user';

const router = useRouter();
const tokenStore = useTokenStore();
const userStore = useUserStore();

onMounted(() => {
	userStore.setUser(null);
	tokenStore.setToken(null);
	router.push('/login');
})
</script>

<template>
</template>