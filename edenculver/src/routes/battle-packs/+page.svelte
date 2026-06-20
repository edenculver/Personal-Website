<script lang="ts">
	import type { PageProps } from "./$types";
	import NavBar from "$lib/components/NavBar.svelte";
	import BattlePack from "$lib/components/BattlePack.svelte";

	let { data }: PageProps = $props();
</script>

<NavBar />
<div class="px-16 py-10 bg-gray-100 dark:bg-gray-900 flex flex-col gap-8">
	<h1 class="text-2xl font-bold">LEGO Star Wars Battle Packs Catalog</h1>
	{#each data.battlePacks as battlePack}
		<BattlePack {battlePack} />
	{/each}
</div>
