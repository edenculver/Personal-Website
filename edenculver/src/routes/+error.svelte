<script lang="ts">
	import { page } from "$app/state";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";
</script>

<StandardPageLayout>
	<h1 class="mx-16 my-10 text-2xl font-bold">{page.status}: {page.error ? page.error.message : "Unknown error"}</h1>
</StandardPageLayout>
