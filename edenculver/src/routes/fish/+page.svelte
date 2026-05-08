<script lang="ts">
	import NavBar from "$lib/components/NavBar.svelte";
	import FishTable from "$lib/components/FishTable.svelte";
	import type { Fish } from "$lib/components/FishTable.svelte";
	import fish from "$lib/fish.json";
</script>

<NavBar />
<div class="bg-(--sv-darktan) flex flex-col gap-6 items-center p-6 text-black">
	<h1 class="bg-(--sv-tan) border-3 border-(--sv-verydarktan) font-bold px-20 py-5 rounded-lg text-2xl text-center">
		Stardew Valley Fish Cheat Sheet
	</h1>
	{#each Object.keys(fish) as location}
		<FishTable {location} fishes={fish[location as keyof typeof fish] as Fish[]} />
	{/each}
</div>
