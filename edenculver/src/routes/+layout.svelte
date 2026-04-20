<script lang="ts">
	import { page } from "$app/state";
	import favicon from "$lib/assets/favicon.svg";

	let { children } = $props();

	let title = $derived(page.data.title || "default");
</script>

<svelte:head>
	<title>{title} | EdenCulver.net</title>
	<link rel="icon" href={favicon} />
</svelte:head>

{@render children()}

<style>
	:global(body) {
		background-color: black;
		color: white;
		font-family: Verdana, Tahoma, sans-serif;
		margin: 0px;
	}
</style>
