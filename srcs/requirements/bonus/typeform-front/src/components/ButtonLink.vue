<script setup>
import { RouterLink } from 'vue-router'
const props = defineProps({
	link: String,
	name: String,
	primary: Boolean
})

</script>

<template>
	<RouterLink class="linkBtn" :class="[primary ? 'primary' : '']" :to="props.link">{{ name }}</RouterLink>
</template>

<style scoped>
.linkBtn {
	background-color: #f5f5f5;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	margin: 5px;
	padding: 10px;
	border-radius: 5px;
}

.linkBtn:hover {
	color: #ba6dd7;
}

.primary {
	color: white;
	background-color: black;
}

</style>
