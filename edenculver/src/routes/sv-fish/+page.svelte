<script lang="ts">
	import fish from "$lib/fish.json";
	import FishTable from "$lib/components/FishTable.svelte";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";
	import type { Fish } from "$lib/components/FishTable.svelte";
</script>

<StandardPageLayout
	classes="p-4 bg-svdarktan text-sm lg:text-base text-black flex flex-col gap-6 flex-1 lg:items-center"
>
	<h1
		class="border-svverydarktan border-2 lg:border-3 rounded-md px-10 lg:px-20 py-5 bg-svtan text-center text-xl lg:text-2xl font-bold"
	>
		Stardew Valley Fish Cheat Sheet
	</h1>

	{#each Object.keys(fish) as location}
		<FishTable {location} fishes={fish[location as keyof typeof fish] as Fish[]} />
	{/each}
</StandardPageLayout>
