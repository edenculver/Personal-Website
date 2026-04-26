<script lang="ts">
	import { page } from "$app/state";
	import favicon from "$lib/assets/favicon.svg";

	let { children } = $props();

	let title = $derived(page.data.title || "default");
</script>

<svelte:head>
	{#if title === "default"}
		<title>EdenCulver.net</title>
	{:else}
		<title>{title} | EdenCulver.net</title>
	{/if}
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
	@media (prefers-color-scheme: light) {
		:global(body) {
			background-color: white;
			color: black;
		}
	}
	:global(.flex) {
		display: flex;
	}
	:global(.column) {
		flex-direction: column;
	}
	:global(.centered) {
		align-items: center;
	}
</style>
