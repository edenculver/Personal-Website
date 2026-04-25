<script lang="ts">
	import NavBar from "$lib/components/NavBar.svelte";
	import { page } from "$app/state";
</script>

<NavBar />
<h1>{page.status}: {page.error ? page.error.message : "Unknown error"}</h1>

<style>
	h1 {
		margin: 20px;
	}
</style>
