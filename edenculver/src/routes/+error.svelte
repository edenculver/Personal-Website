<script lang="ts">
	import NavBar from "$lib/components/NavBar.svelte";
	import { page } from "$app/state";
</script>

<NavBar />
<h1 class="font-bold m-10 text-3xl">{page.status}: {page.error ? page.error.message : "Unknown error"}</h1>
