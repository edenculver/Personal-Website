<script lang="ts">
	import fish from "$lib/fish.json";
	import FishTable from "$lib/components/FishTable.svelte";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";
	import type { Fish } from "$lib/components/FishTable.svelte";
</script>

<StandardPageLayout>
	<div class="p-6 bg-svdarktan text-black flex flex-col gap-6 items-center">
		<h1 class="border-svverydarktan border-3 rounded-lg px-20 py-5 bg-svtan text-center text-2xl font-bold">
			Stardew Valley Fish Cheat Sheet
		</h1>
		{#each Object.keys(fish) as location}
			<FishTable {location} fishes={fish[location as keyof typeof fish] as Fish[]} />
		{/each}
	</div>
</StandardPageLayout>
