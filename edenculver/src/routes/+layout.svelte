<script lang="ts">
	import { page } from "$app/state";
	import "../app.css";
	import favicon from "$lib/assets/favicon.svg";

	let { children } = $props();
</script>

<svelte:head>
	{#if page.data.title}
		<title>{page.data.title} | EdenCulver.net</title>
	{:else}
		<title>EdenCulver.net</title>
	{/if}
	{#if page.data.description}
		<meta name="description" content={page.data.description} />
	{/if}
	<link rel="icon" href={favicon} />
</svelte:head>

{@render children()}
