<script setup>
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'
import ButtonLink from '@/components/ButtonLink.vue'

import { ref } from 'vue'

const partners = ref([
	"https://cdn.prod.website-files.com/6718da5ecf694c9af0e8d5d7/672890ca58ffc8edfb664691_webflow.svg", 
	"https://cdn.prod.website-files.com/6718da5ecf694c9af0e8d5d7/672890be48319096ffeb6bfe_zapier.svg",
	"https://cdn.prod.website-files.com/6718da5ecf694c9af0e8d5d7/672890a3d27752eaed89aa47_hubspot.svg",
	"https://cdn.prod.website-files.com/6718da5ecf694c9af0e8d5d7/67289096a54485774b102f83_hermes.svg",
	"https://cdn.prod.website-files.com/6718da5ecf694c9af0e8d5d7/672890d44ff06c03b9169b96_slack.svg",
])

</script>

<template>
	<Header />
	<main>
		<div id="hero">
			<h1>Get to know your customers with forms worth filling out</h1>
			<p>Collect all the data you need to <strong>understand customers</strong> with forms designed to be refreshingly different.</p>
			<ButtonLink link="/create" name="Get started" primary />
		</div>
		<div id="partners">
			<div v-for="(item, key) in partners" class="item" :key="key">
				<img :src="item" loading="lazy" />
			</div>
		</div>
	</main>
  	<Footer />
</template>

<style scoped>
main {
	margin-top: 60px;
	height: calc(100vh - 130px);
}

#hero {
	background-color: #f5f5f5;
	padding: 95px ;
	text-align: center;
}

h1 {
	font-size: 4.3rem;
	width: 65%;
	margin: auto;
}

#partners {
	padding-top: 10px;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: center;
}

.item {
	width: 15%;
	margin: 10px;
	padding: 20px;
	border-radius: 5%;
	text-align: center;
	background: #f5f5f5;
}

.item img {
	width: 100px;
}

</style>
