<script lang="ts">
	import fish from "$lib/fish.json";
	import FishTable from "$lib/components/FishTable.svelte";
	import Page from "$lib/components/Page.svelte";
	import type { Fish } from "$lib/components/FishTable.svelte";
</script>

<Page title="EdenCulver.net > Reference > Stardew Valley Fish Cheat Sheet">
	<div class="p-4 bg-svdarktan text-sm lg:text-base text-black flex flex-col gap-6 flex-1 lg:items-center">
		{#each Object.keys(fish) as location}
			<FishTable {location} fishes={fish[location as keyof typeof fish] as Fish[]} />
		{/each}
	</div>
</Page>
