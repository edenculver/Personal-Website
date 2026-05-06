<script lang="ts">
	import { page } from "$app/state";
	import "../app.css";
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
