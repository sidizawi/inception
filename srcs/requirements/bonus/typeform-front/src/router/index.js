import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/views/Home.vue'
import Login from '@/views/Login.vue'
import Signup from '@/views/Signup.vue'
import Logout from '@/views/Logout.vue'
import Dashboard from '@/views/Dashboard.vue'
import UserDetail from '@/views/UserDetail.vue'

const router = createRouter({
	history: createWebHistory(import.meta.env.BASE_URL),
	routes: [
		{
			path: '/',
			name: 'home',
			component: Home,
		},
		{
			path: '/login',
			name: 'login',
			component: Login,
		},
		{
			path: '/register',
			name: 'register',
			component: Signup,
		},
		{
			path: '/dashboard',
			name: 'dashboard',
			component: Dashboard,
			children: [
				{
					path: 'profile',
					name: 'profile',
					component: UserDetail,
				},
			],
		},
		{
			path: '/logout',
			name: 'logout',
			component: Logout,
		}
	],
})

export default router
